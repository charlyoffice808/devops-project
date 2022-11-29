NOTICE: Due to some flask rq package issues in Python, I packaged this project to run in a development environment. I was able to get things working locally modifying the dysfunctional package.I thought the problem was with my operating system (Ubuntu 22.04.1 LTS), but I encountered the same problem after running a TRANSACTION SERVICE API in Docker. I tried different flavors of Python images with no success.

ERROR below:

2022-11-29 17:51:12 Traceback (most recent call last):
2022-11-29 17:51:12   File "/app/run.py", line 9, in <module>
2022-11-29 17:51:12     from flask_rq import get_queue
2022-11-29 17:51:12   File "/usr/local/lib/python3.10/site-packages/flask_rq.py", line 19, in <module>
2022-11-29 17:51:12     from rq import Queue, Worker
2022-11-29 17:51:12   File "/usr/local/lib/python3.10/site-packages/rq/__init__.py", line 8, in <module>
2022-11-29 17:51:12     from .job import cancel_job, get_current_job, requeue_job
2022-11-29 17:51:12   File "/usr/local/lib/python3.10/site-packages/rq/job.py", line 15, in <module>
2022-11-29 17:51:12     from .utils import enum, import_attribute, utcformat, utcnow, utcparse
2022-11-29 17:51:12   File "/usr/local/lib/python3.10/site-packages/rq/utils.py", line 16, in <module>
2022-11-29 17:51:12     from collections import Iterable
2022-11-29 17:51:12 ImportError: cannot import name 'Iterable' from 'collections' (/usr/local/lib/python3.10/collections/__init__.py)

This is what I did locally to solve the issue:

I modified this line in flask_rq.py "from redis._compat import urlparse" to "from urllib.parse import urlparse"

Unfortunately, I was unable to implement an HTTP router in front of the services that routes requests to the appropriate service using Nginx.

To get started, clone or download the project and follow the steps below:

I wrote three separate batch scripts to start services in the correct order. I used source command instead of sh to execute the batch scripts because each service runs in a separate environment for best practice and to simulate how these services would run separately as containers/microservices.

1. source automate-auth-api.sh 
after running this script open any web browser and enter this url http://127.0.0.1:5000/token

2. source automate-transaction-api.sh
after running this script open any web browser and enter this url http://127.0.0.1:5050/transaction
N.B: port number is 5050 instead of 5000. Each service must run on it's own unique port, reason why path-based routing is so important.

3. source automate-loyalty-worker-api.sh

when all the services are up and running. Login to http://127.0.0.1:5000/token to generate a token. Copy a token and use it in http://127.0.0.1:5050/transaction to validate/peform a transaction. Lastly check the logs of automate-loyalty-worker-api.sh

Extra Features:

I created a simple frontend with only HTML and CSS.
Instead of using JSON responses or HTTPie, I passed errors to the frontend.

This project was fantastic. I wish I could have finished it. Thank you for your consideration.

Regards,
Charles





