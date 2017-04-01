function MySendMail(answer)
%此程序可放在主运行程序的最后来提醒你，你的程序已经运行完毕
%唯一的参数为程序最后的运行结果(默认为数字，矩阵也行)
%但是此程序还无法在你的程序意外中断的时候来确保发送邮件（可以改进）
%程序只要改几个参数可以适用于163，gmail和QQ邮箱上，其他好像不太行

%这里以QQ为例子
%MailAddress是选取你的发件邮箱
%password是SMIP的第三方登录时的授权密码，注意不是你QQ的密码
%首先要做的是开启QQ邮箱的开启POP3/SMTP服务
%打开QQ邮箱的设置--账户--POP3/IMAP/SMTP服务，打开相应的选项即可。
%会有一个发送短信至1069*****什么的来让你确认开启这一选项
%开启成功后它会告诉你第三方登录密码也就是我们的   PASSWOED!!!!!!
%你也可以开启QQ邮箱的手机号码邮箱服务，这样就可以通过短信来确认有没有邮件寄过来
%当然我更希望可以在QQ里面开启邮箱提醒，还方便预览



MailAddress = 'QQ号@qq.com';
password = '第三方登录密码';  

%添加附件先不弄了
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

%subject 是邮件的主题
%content是邮件的内容,
subject = 'MATLAB 发的测试邮件';
content =strcat('结果是：',num2str(answer));  %可以将数包括矩阵复制到邮件中支持扩展  
sendmail('接收邮箱',subject,content);