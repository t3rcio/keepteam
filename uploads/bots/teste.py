from datetime import datetime
with open('/home/tercio/resultado.log','w') as f:
	for i in range(1,200):
		f.write('\n%s\n' % (datetime.now()))
f.close()
		
