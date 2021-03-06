var layout = new Class(function(querys, forms){
	
	var that = this;
	this.load(querys, forms);
	this.position('home', null, { name: '主页', title: '欢迎光临', src: iPress.setURL('page', 'home') });
	
	fs(contrast(':private/themes/' + this.data.global.blog_theme + '/views/index.asp')).exist().then(function(){
		that.render('index.asp');
	}).fail(function(){
		try{
			blog.conn.Close();
			Response.Redirect(iPress.setURL('page', 'articles'));
		}catch(e){}
	});
	
});

layout.extend(require(':public/library/layout'));

module.exports = layout;