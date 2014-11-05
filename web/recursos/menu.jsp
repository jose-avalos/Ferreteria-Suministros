<!-- cuadro grande de arriba donde va el logo>-->
        <header>   </header>
        <nav>
            
            <h1 id="words">Todo para el Hogar</h1>
            <div>
                
            <li class="home-page"><a href="index.jsp"><span></span></a></li>
                <!--<ul class="menu">
            
                        <c:if test="${sessionScope.cargo!=null}">
                        <li><a href="cerrar_sesion?valor=cerrar">Cerrar Sesion</a></li>
                        </c:if>
                        <c:if test="${sessionScope.cargo==null}">
                        <li><a class="log" href="#">Iniciar Sesion</a></li>
                        </c:if>

                </ul>-->
                <div id="dialogo">
                    <form method="POST" action="login">
                        Usuario<input type="text" class="redondes" id="user" name="user"><br>
                        Contraseña <input type="password" class="redondes" id="pass" name="pass"><br><br>
                        <p> 
                            <button type="submit" id="send" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">
                                <span class="ui-button-text">Iniciar Sesión</span>
                            </button>
                            <!-- <button type="reset" id="borrar" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">
                                    <span class="ui-button-text">Borrar</span>
                            </button> -->
                        </p>
                    </form>
                </div>
            </div>
        </nav>
        
        <section>
            <article>
                

<ul id="jMenu">
            <li>
                <a id="categoria">Categorias</a>
                <ul>
                    <li>
                        <li><a href="categorialista.jsp">Listado Categorias</a>
                        <ul>
                                
                                <ul>
                                    <li>
                                        <ul>
                                            <li>
                                                <ul>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li><a href="categorias.jsp">Crear Categoria </a></li>
                    <li>
                        <ul>
                            <li>
                                <ul>
                                    <li><a>Category 1.4</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    
                </ul>
            </li>
            <li>
                <a id="categoria">Empleados</a>
                <ul>
                    <li>
                        <a href="listaEmpleados.jsp">Lista Empleados</a>
                        <ul>
                            
                        </ul>
                    </li>
                    <li>
                        <a href="Empleado.jsp">Ingresar Empleado</a>
                            <ul>
                            
                        </ul>
                    </li>
                    <li>
                        <ul>
                            
                        </ul>
                    </li>
                    
                </ul>
            </li>

            <li>
                <a id="categoria">Proveedores</a>
                <ul>
                    <li>
                        <a href="Proveedores.jsp">Lista proveedores</a>
                        <ul>
                        
                        </ul>
                    </li>
                    <li>
                        <a href="Productos.jsp">Ingresar Productos</a>
                        
                    </li>
                    <li><a href="productosLista.jsp">Lista Productos</a></li>
                    
                </ul>
            </li>

            <li>
                <a id="categoria">Usuarios</a>
                <ul>
                    <li><a href="usuariolista.jsp">lista Usuarios</a></li>
                    <li>
                        <a href="usuarios.jsp">Crear Usuarios</a>
                        <ul>
                          
                        </ul>
                    </li>
                    
                </ul>
            </li>

            <li>
                <a id="categoria" >Vehiculos</a>
                <ul>
                    <li>
                        <a href="vehiculos.jsp">Ingresar Vehiculos</a>
                        <ul>
                        </ul>
                    </li>
                    <li><a href="vehiculoslista.jsp">Lista de vehiculos</a></li>
                    
                </ul>
            </li>

            <li><a id="categoria">Clientes</a>
            <ul>
                    <li>
                        <a href="Cliente.jsp">Ingresar Cliente</a>
                        </ul>
                
            </li>
                
            <li>
                
                <c:if test="${sessionScope.cargo!=null}">
                        <li><a href="cerrar_sesion?valor=cerrar">Cerrar Sesion</a></li>
                        </c:if>
                        <c:if test="${sessionScope.cargo==null}">
                        <li><a class="log" href="#">Iniciar Sesion</a></li>
                        </c:if>
               
            </li>
        </ul>