class QuickbooksController < ApplicationController
  before_action :set_soap_header, :except => :qwc

  def clientVersion(version)
  end

  def authenticate(username, password)
  end

  def connectionError(ticket, hresult, message)
  end

  def sendRequestXML(ticket, hpc_response, company_file_name, country, qbxml_major_version, qbxml_minor_version)
  end

  def receiveResponseXML(ticket, response, hresult, message)
  end

  def getLastError(ticket)
  end

  def closeConnection(ticket)
  end

  def qwc
   qwc = <<QWC
<QBWCXML>
  <AppName>My App</AppName>
  <AppID></AppID>
  <AppURL>http://localhost:3000/api/quickbooks</AppURL>
  <AppDescription>My app rocks!</AppDescription>
  <AppSupport>http://localhost:3000</AppSupport>
  <UserName>username</UserName>
  <OwnerID>{57F3B9B1-86F1-4fcc-B1EE-566DE1813D20}</OwnerID>
  <FileID>{90A44FB5-33D9-4815-AC85-BC87A7E7D1EB}</FileID>
  <QBType>QBFS</QBType>
  <Style>RPC</Style>
  <Scheduler>
     <RunEveryNMinutes>5</RunEveryNMinutes>
  </Scheduler>
</QBWCXML>
QWC
   send_data qwc, :filename => 'my_app.qwc'
 end

 private  
   def set_soap_header
     if request.env['HTTP_SOAPACTION'].blank? || request.env['HTTP_SOAPACTION'] == %Q("")
       xml = REXML::Document.new(request.raw_post)
       element = REXML::XPath.first(xml, '/soap:Envelope/soap:Body/*')
       request.env['HTTP_SOAPACTION'] = element.name if element
     end
   end
end
