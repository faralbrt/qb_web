class QuickbooksController < ApplicationController
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
end
