<security:authorize access="hasAnyRole('ROLE_USER','ROLE_MANAGER')" >
                <ul id="active" class="nav navbar-nav side-nav">
                    <li ${page == 'welcome' ? 'class=\'selected\'' : ''}><a href="${contextPath}/welcome"><i class="fa fa-bullseye"></i> Dashboard</a></li>
                    <li class="divider"></li>
                    <li ${page == 'reservations' ? 'class=\'selected\'' : ''}><a href="${contextPath}/reservations"><i class="fa fa-tasks"></i> List of reservations</a></li>
                    
                    <li class="divider"></li>    
                    <security:authorize access="hasRole('ROLE_MANAGER')" >
                    
                        <li ${page == 'roomregistration' ? 'class=\'selected\'' : ''}><a href="${contextPath}/roomregistration"><i class="fa fa-bed"></i> Add a room</a></li>
                    	<li ${page == 'rooms' ? 'class=\'selected\'' : ''}><a href="${contextPath}/rooms"><i class="fa fa-building"></i> List of rooms</a></li>
                    	<li class="divider"></li>   
                    	<li ${page == 'registration' ? 'class=\'selected\'' : ''}><a href="${contextPath}/registration"><i class="fa fa-user"></i> Create a user</a></li>
                    	<li ${page == 'users' ? 'class=\'selected\'' : ''}><a href="${contextPath}/users"><i class="fa fa-users"></i> List of users</a></li>
                    	<li class="divider"></li>
                    	<li ${page == 'reports' ? 'class=\'selected\'' : ''}><a href="${contextPath}/reports"><i class="fa fa-book"></i> Gerenate reports</a></li>
                     </security:authorize>            
                  
                </ul>
            </security:authorize> 