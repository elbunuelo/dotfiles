#! /bin/bash
# Queries the Aha graphQL API to extract the number of tickets
# assigned to engineering and to the person identified by the $NAME
# variable.
# Requires two environment variables $AHA_API_KEY and $NAME, which
# can be set in the $HOME/.zendesk_indicator file.
cd "$(dirname "$0")"
[ -f $HOME/.zendesk_indicator ] && source $HOME/.zendesk_indicator

GRAPHQL_QUERY='{"query":"query MyQuery {\n  account {\n    extensionFields(filters: {extensionIdentifier: \"aha-app.aha-eng-dashboard\", name: \"zendesk:assignedEscalationsByEngineer\"}) {\n      \n      value\n    }\n  }\n}\n","variables":null,"operationName":"MyQuery"}'
JQ_QUERY=$(printf '.["data"]["account"]["extensionFields"][0]["value"]["value"] | .[] | select(.name=="%s" or .name=="Engineering") | .["tickets"]' "$NAME")

RESPONSE=$(curl -s 'https://big.aha.io/api/v2/graphql' \
  -H "authorization: Bearer $AHA_API_KEY" \
  -H 'accept: application/json' \
  -H 'accept-language: en-US,en;q=0.9' \
  -H 'content-type: application/json' \
  --data-raw "$GRAPHQL_QUERY")

RESULT=$(echo "$RESPONSE" | jq "$JQ_QUERY")

if [[ $? != 0 ]]
then
  echo ""
  echo "$RESPONSE" >> ./logs/zendesk/error.log
  exit 1
fi

# If the result is empty, it means that neither the engineering team nor
# the user have any tickets. Add 0 as a default value.
if [[ "$RESULT" == "" ]]
then
  RESULT="0"
fi

# If result is only one line long, it means that the user doesn't
# have any assigned tickets. Add a second line with 0 so that the
# output is displayed correctly
if [[ $(echo "$RESULT" | wc -l | xargs) == "1" ]]
then
  RESULT=$RESULT$'\n0'
fi

# Reverse the order so that the assigned tickets go first and then
# concatenate the two lines.
RESULT=$(echo "$RESULT"| tac | paste -d "" - -)

echo " $RESULT"
