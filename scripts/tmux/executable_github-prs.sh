#! /bin/bash

USER_NAME="elbunuelo"
TEAM_NAME="knowledge-team"
MILLIS_SINCE_UPDATE=99999
OUTPUT_FILE="prs-output"


cd "$(dirname "$0")"
if [[ -f "$OUTPUT_FILE" ]]
then
  MILLIS_SINCE_UPDATE=$((($(date +%s) - $(date -r "$OUTPUT_FILE" +%s))))
fi

if [[ $MILLIS_SINCE_UPDATE > 300000 ]]
then
  ICON=""
  USER_ICON=""
  TEAM_ICON=""
  APPROVED_ICON=""
  CHECKING_ICON=""
  FAILURE_ICON=""
  CHANGES_ICON=""
  COMMENTS_ICON=""

  STATUS="$ICON "

  PRS_WAITING_FOR_REVIEW=$(gh search prs --repo=aha-app/aha-app --state open "user-review-requested:$USER_NAME" | wc -l | xargs)
  if [[ "$PRS_WAITING_FOR_REVIEW" != "0" ]]
  then
    STATUS=$(printf "%s %s" "$STATUS" "$USER_ICON $PRS_WAITING_FOR_REVIEW")
  fi

  TEAM_PRS_WAITING_FOR_REVIEW=$(gh search prs --repo=aha-app/aha-app --state open "team-review-requested:aha-app/$TEAM_NAME" | wc -l | xargs)
  if [[ "$TEAM_PRS_WAITING_FOR_REVIEW" != "0" ]]
  then
    STATUS=$(printf "%s %s" "$STATUS" "$TEAM_ICON $TEAM_PRS_WAITING_FOR_REVIEW")
  fi

  PRS_APPROVED=$(gh search prs --repo=aha-app/aha-app --state open --author "$USER_NAME" --review approved | wc -l | xargs)
  if [[ "$PRS_APPROVED" != "0" ]]
  then
    STATUS=$(printf "%s %s" "$STATUS" "$APPROVED_ICON $PRS_APPROVED")
  fi

  PRS_FAILED=$(gh search prs --repo=aha-app/aha-app --state open --author "$USER_NAME" --checks failure "draft:false" | wc -l | xargs)
  if [[ "$PRS_FAILED" != "0" ]]
  then
    STATUS=$(printf "%s %s" "$STATUS" "$FAILURE_ICON $PRS_FAILED")
  fi

  PRS_CHECKING=$(gh search prs --repo=aha-app/aha-app --state open --author "$USER_NAME" --checks pending "draft:false" | wc -l | xargs)
  if [[ "$PRS_CHECKING" != "0" ]]
  then
    STATUS=$(printf "%s %s" "$STATUS" "$CHECKING_ICON $PRS_CHECKING")
  fi

  PRS_CHANGES_REQUESTED=$(gh search prs --repo=aha-app/aha-app --state open --author "$USER_NAME" --review changes_requested | wc -l | xargs)
  if [[ "$PRS_CHANGES_REQUESTED" != "0" ]]
  then
    STATUS=$(printf "%s %s" "$STATUS" "$CHANGES_ICON $PRS_CHANGES_REQUESTED")
  fi

  PRS_COMMENTS=$(gh search prs --repo=aha-app/aha-app --state open --author "$USER_NAME" --comments ">0"  | wc -l | xargs)
  if [[ "$PRS_COMMENTS" != "0" ]]
  then
    STATUS=$(printf "%s %s" "$STATUS" "$COMMENTS_ICON $PRS_COMMENTS")
  fi

  echo "$STATUS" > "$OUTPUT_FILE"
fi

cat "$OUTPUT_FILE"
