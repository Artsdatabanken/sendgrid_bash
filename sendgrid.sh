#From your script or the commandline add the necessary parameters listed below. 

SENDGRID_API_KEY=""
EMAIL_TO="$1"
FROM_EMAIL="$2"
FROM_NAME="$3"
SUBJECT="$4"
bodyHTML="<p>$5</p>"

maildata='{"personalizations": [{"to": [{"email": "'${EMAIL_TO}'"}]}],"from": {"email": "'${FROM_EMAIL}'",
        "name": "'${FROM_NAME}'"},"subject": "'${SUBJECT}'","content": [{"type": "text/html", "value": "'${bodyHTML}'"}]}'

curl --request POST \
  --url https://api.sendgrid.com/v3/mail/send \
  --header 'Authorization: Bearer '$SENDGRID_API_KEY \
  --header 'Content-Type: application/json' \
  --data "$maildata"
