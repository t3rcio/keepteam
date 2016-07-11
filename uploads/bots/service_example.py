from services.daemon import Daemon
from datetime import datetime
from cron.models import *

class ServicesExample(Daemon):
    def run(self):
        with open('/home/tercio/service_example_log.txt','rt'):
            print datetime.now()

