import os
from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Mail

message = Mail(
    from_email='from-email@some-domain.com',
    to_emails='to-email@some-domain.com',
    subject='Subject for the message',
    html_content='<strong>Some message</strong>')
try:
    # Save the API key from sendgrid as env variable with the
    # key name as SENDGRID_API_KEY.
    key = os.environ.get('SENDGRID_API_KEY')
    sg = SendGridAPIClient(key)
    response = sg.send(message)
    print(response.status_code)
except Exception as e:
    print(str(e))
