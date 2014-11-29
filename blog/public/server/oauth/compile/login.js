var login = new Class(function( querys, forms ){
	this.error = 0;
	
	this.appid = 10083;
	this.appkey = '733ff118f081071d95615a0c60cb4cba4835f9d7';
	
	this.getFrom(querys.from);
	this.getCode();
	this.getState();
	
	var sess = Session(blog.tb + "oauth_jump");
	
	this.then(function(){
		if ( sess === this.state ){
			this.resolve();
		}else{
			this.error = 10002;
			this.reject();
		}
	})
	.getToken()
	.getOpenid()
	.getUserInfo()
	.save()
	.then(function(){
		Response.Redirect(this.from);
	});
});

login.add('getFrom', function(querysfrom){
	var from = querysfrom.replace(/\|/g, '=');
	var base64 = require('base64');
	this.from = base64.decode(from);
});

login.add('getCode', function(){
	this.code = http.query('code');
});

login.add('getState', function(){
	this.state = http.query('state');
});

login.add('getToken', function(){
	return this.then(function(){
		var msg = new ajax().getJSON(blog.appsite + "/oauth/token", {
			grant_type: "authorization_code",
			client_id: this.appid,
			client_secret: this.appkey,
			code: this.code,
			redirect_uri: blog.mysite
		});
		
		if ( msg.error && msg.error > 0 ){
			this.error = msg.error;
			this.reject();
		}else{
			this.resolve();
			this.token = msg.data.access_token;
			this.hashkey = msg.data.token_hashkey;
			this.expires_in = msg.data.expires_in;
		}
	
	});
});

login.add('getOpenid', function(){
	return this.then(function(){
		var msg = new ajax().getJSON(blog.appsite + "/oauth/openid", { access_token: this.token });
		if ( msg.error && msg.error > 0 ){
			this.error = msg.error;
			this.reject();
		}else{
			if ( msg.data.client_id == this.appid ){
				this.resolve();
				this.openid = msg.data.openid;
			}else{
				this.reject();
				this.error = 10017;
			}
		}
	});
});

login.add('getUserInfo', function(){
	return this.then(function(){
		var msg = new ajax().getJSON(blog.appsite + "/oauth/me", {
			access_token: this.token,
			oauth_consumer_key: this.appid,
			openid: this.openid
		});

		if ( msg.error && msg.error > 0 ){
			this.error = msg.error;
			this.reject();
		}else{
			this.resolve();
			this.user = msg.data;
		}
	});
});

login.add('save', function(){
	return this.then(function(){

		var user = require(':public/library/user');

		var params = {
			hashkey: this.hashkey,
			openid: this.openid,
			nick: this.user.nick,
			mail: this.user.mail,
			birthday: this.user.birthday < 0 ? 0 : this.user.birthday,
			address: this.user.address || '',
			website: this.user.website || '',
			sex: this.user.sex || 0,
			avatar: this.user.sex || 0,
			token: this.token,
			expires_in: this.expires_in
		}
		
		var users = new user();
		var status = users.oAuthLogin(params);
		
		if ( status.success ){
			this.resolve();
		}else{
			this.error = 10019;
			this.reject();
		}
	});
});

login.extend(task);

module.exports = login;