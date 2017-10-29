import random
import string
import urllib
import urllib2
import hashlib
import hmac
import time

def randomstrgenerator():
  alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
  min = 5
  max = 15
  total = 1000000
  string=''
  for count in xrange(1,total):
    for x in random.sample(alphabet,random.randint(min,max)):
        string+=x
    return string
    break  
    string=''

def concatenate(strlist):
  i=0
  out_str = ''
  while i < len(strlist):
    out_str += strlist[i]
    i += 1
  return out_str

#main program
t_stamp = str(int(time.time()))
my_status = urllib.quote(raw_input("Please Enter your new status : "), '')
twit = urllib.quote("http://api.twitter.com/1/statuses/update.json", '')
o_nounce = randomstrgenerator()
all_var = ["oauth_consumer_key=8qRfFvVHHkw8sOy7AVYlA","&oauth_nounce="+o_nounce,"&oauth_signature_method=HMAC-SHA1","&oauth_timestamp="+t_stamp,"&oauth_token=249742595-UN8td9dJnYGcjXCzTOLRzbakxLQC0iDlcEPTKM8a","&oauth_version=1.0","&status="+my_status]
con_var = concatenate(all_var)
print con_var
encr_var = urllib.quote(con_var, '')
print encr_var
base = "POST&" + twit + "&" + encr_var
key = "2zNonOWTavqxgOA1T6OWOCSr3bc1cFHHMKPDEx7Yec&i9VDCKC3gSyZbxfX6MlRnXjwbkjZzSMkofg5z696zEc"
sign = hmac.new(key, base, hashlib.sha1).digest().encode('base64')[:-1]
print sign

new_var = con_var + "&oauth_signature=" + urllib.quote(sign,'')
ask = urllib2.Request("http://api.twitter.com/1/statuses/update.json", new_var, headers = {"Authorization":"OAuth", "Content-type":"application/x-www-form-urlencoded"})
final = urllib2.urlopen(ask)
print final



