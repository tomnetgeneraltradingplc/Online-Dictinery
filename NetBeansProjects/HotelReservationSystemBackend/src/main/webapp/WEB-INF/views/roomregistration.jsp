 <%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:master>
 	<jsp:attribute name="title">Add a room</jsp:attribute> 
 	<jsp:attribute name="page">roomregistration</jsp:attribute> 
 	
 	
 	<jsp:body>
 		     <div class="row">
                <div class="col-sm-4">
                  
                     <form:form method="POST" modelAttribute="roomForm" class="form-signin" role="form">
					        
					        <div class="form-group">
                            	<label>File input</label>
                            	<input type="file">
                        	</div>
                        
					        <spring:bind path="username">
					            <div class="form-group">
					                <form:input type="text" path="username" class="form-control" placeholder="Username"
					                            autofocus="true"></form:input>
					                <form:errors path="username"></form:errors>
					            </div>
					        </spring:bind>
					
					        <spring:bind path="password">
					            <div class="form-group">
					                <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
					                <form:errors path="password"></form:errors>
					            </div>
					        </spring:bind>
					
					        <spring:bind path="passwordConfirm">
					            <div class="form-group">
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










