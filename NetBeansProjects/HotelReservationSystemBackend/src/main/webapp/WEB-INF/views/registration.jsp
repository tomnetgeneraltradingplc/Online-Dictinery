
 <%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:master>
 	<jsp:attribute name="title">Create a User</jsp:attribute> 
 	<jsp:attribute name="page">registration</jsp:attribute> 
 	
 	
 	<jsp:body>
 		
		<div class="row">
                <div class="col-lg-12">
                    <h1>New User <small>All new users are receptionists</small></h1>
                    <div class="alert alert-dismissable alert-warning">
                        <button data-dismiss="alert" class="close" type="button">&times;</button>
                        Welcome to the admin dashboard! Feel free to review all pages and modify the layout to your needs. 
                        <br />
                        This theme uses the <a href="https://www.shieldui.com">ShieldUI</a> JavaScript library for the 
                        additional data visualization and presentation functionality illustrated here.
                    </div>
                </div>
            </div>
            
            
            
            
         
            
            
            
            <div class="row">
                <div class="col-sm-4">
                  
                     <form:form method="POST" modelAttribute="userForm" class="form-signin">
					        
					        <spring:bind path="username">
					            <div class="form-group ${status.error ? 'has-error' : ''}">
					                <form:input type="text" path="username" class="form-control" placeholder="Username"
					                            autofocus="true"></form:input>
					                <form:errors path="username"></form:errors>
					            </div>
					        </spring:bind>
					
					        <spring:bind path="password">
					            <div class="form-group ${status.error ? 'has-error' : ''}">
					                <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
					                <form:errors path="password"></form:errors>
					            </div>
					        </spring:bind>
					
					        <spring:bind path="passwordConfirm">
					            <div class="form-group ${status.error ? 'has-error' : ''}">
					                <form:input type="password" path="passwordConfirm" class="form-control"
					                            placeholder="Confirm your password"></form:input>
					                <form:errors path="passwordConfirm"></form:errors>
					            </div>
					        </spring:bind>
					
					        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
					    </form:form>
                  
                </div>
            </div>
            
            
		

 	</jsp:body>
 
 </t:master>












