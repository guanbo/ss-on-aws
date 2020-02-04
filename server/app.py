# -*- coding: utf-8 -*-

from http.server import HTTPServer, BaseHTTPRequestHandler

import boto3

client = boto3.client('ec2')

class AuthorizationHttpRequestHandler(BaseHTTPRequestHandler):
  
  def do_GET(self):
    if self.path != '/auth':
      self.send_response_only(404, 'Not Found')
      return
    
    self.send_response(200)
    self.send_header('Content-Type', 'text/html')
    self.end_headers()
    self.wfile.write(bytes("Authorized: "+self.client_address[0], "utf-8"))
    cidrip=self.client_address[0]+"/32"
    client.authorize_security_group_ingress(CidrIp=cidrip,FromPort=10200,ToPort=10300,GroupName="ss",IpProtocol="tcp")
    client.authorize_security_group_ingress(CidrIp=cidrip,FromPort=10200,ToPort=10300,GroupName="ss",IpProtocol="udp")

httpd = HTTPServer(('0.0.0.0', 10201), AuthorizationHttpRequestHandler)
httpd.serve_forever()