function MySendMail(answer)
%�˳���ɷ��������г��������������㣬��ĳ����Ѿ��������
%Ψһ�Ĳ���Ϊ�����������н��(Ĭ��Ϊ���֣�����Ҳ��)
%���Ǵ˳����޷�����ĳ��������жϵ�ʱ����ȷ�������ʼ������ԸĽ���
%����ֻҪ�ļ�����������������163��gmail��QQ�����ϣ���������̫��

%������QQΪ����
%MailAddress��ѡȡ��ķ�������
%password��SMIP�ĵ�������¼ʱ����Ȩ���룬ע�ⲻ����QQ������
%����Ҫ�����ǿ���QQ����Ŀ���POP3/SMTP����
%��QQ���������--�˻�--POP3/IMAP/SMTP���񣬴���Ӧ��ѡ��ɡ�
%����һ�����Ͷ�����1069*****ʲô��������ȷ�Ͽ�����һѡ��
%�����ɹ�������������������¼����Ҳ�������ǵ�   PASSWOED!!!!!!
%��Ҳ���Կ���QQ������ֻ�����������������Ϳ���ͨ��������ȷ����û���ʼ��Ĺ���
%��Ȼ�Ҹ�ϣ��������QQ���濪���������ѣ�������Ԥ��



MailAddress = 'QQ��@qq.com';
password = '��������¼����';  

%��Ӹ����Ȳ�Ū��
% a = rand(100);
% DataPath = [matlabroot,filesep,'mydata.md'];
% save(DataPath,'a');

setpref('Internet','E_mail',MailAddress);
setpref('Internet','SMTP_Server','smtp.qq.com');
setpref('Internet','SMTP_Username',MailAddress);
setpref('Internet','SMTP_Password',password);
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class','javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');

%subject ���ʼ�������
%content���ʼ�������,
subject = 'MATLAB ���Ĳ����ʼ�';
content =strcat('����ǣ�',num2str(answer));  %���Խ������������Ƶ��ʼ���֧����չ  
sendmail('��������',subject,content);