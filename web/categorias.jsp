<%@include file="/recursos/header.jsp" %>

<title>Categorias</title>
        <style type="text/css">
            .formcat{
/*              background: #ecf0f1;*/
                background: #f2f6f9;
                border: 1px solid #dedede;
                margin: auto;
                width: 250px;
                padding-top: 20px;
                padding-left: 30px;
                padding-bottom: 15px;
                padding-right: 5px;
                border-radius: 5px; 
            }
            .formcat input{
                /*background: #efefef;*/
                background: #fff;
                border: 1px solid #dedede;
                border-radius: 7px; 
                color: #3a3a3a;
                padding: 10px;
                margin-top: 10px;
                width: 200px;
                height: 10px;
                font-size: 0.9em;
            }
            .formcat label {
                display: block;
                margin-top: 20px;
                letter-spacing: 2px;
            }
            .formcat b {
                color: red;
            }
            .formcat button{
                margin-top: 5px;
                margin-left: 5px;
                padding: 5px;
                
            }
            .formcat div{
                text-align: right;
                margin-top: 30px;
                padding-right: 30px;
            }
            
        </style>
    </head>
    <body>

        <%@include file="/recursos/menu.jsp" %>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#jMenu").jMenu({
                    openClick : false,
                    ulWidth :'auto',
                     TimeBeforeOpening : 100,
                    TimeBeforeClosing : 11,
                    animatedText : false,
                    paddingLeft: 1,
                    effects : {
                        effectSpeedOpen : 150,
                        effectSpeedClose : 150,
                        effectTypeOpen : 'slide',
                        effectTypeClose : 'slide',
                        effectOpen : 'swing',
                        effectClose : 'swing'
                    }

                });
            });
            
            function convertir(tipo) {
                var mensaje = document.getElementById("descripC");
                var texto = mensaje.value;
                if (tipo == 1){
                mensaje.value = texto.toUpperCase();
            } else if(tipo == 2){
                mensaje.value = texto.toLowerCase();
            }
                
                
                
            }
        </script>
        
        <article>
                <script type="text/javascript">
            $(function() { 
                $("#cat").validity(function() {
                    $.validity.patterns.nombre = /^[\S][\w\s-ñÑ.]{0,}[\S]$/;
                    $.validity.messages.nombre ="<p>-No se aceptan simbolos (%$#!)</p><p>-No espacios al Inicio ni Final</p><p>-Dos letras como minimo</p>";
                    $.validity.patterns.descripcion = /^[\S][\w\s-ñÑ@#$%&=+-.]{0,}[\S]$/;
                    $.validity.messages.descripcion ="<p>-Simbolos aceptados: @#$%&=+-</p><p>-No espacios al Inicio ni Final</p><p>-Dos letras como minimo</p>";
                    $("#nombreC").require("Este campo es Requrido").match("nombre");
                    $("#descripC").match("descripcion");
                });
                
                $("#borrar2").click(function(){
                    $("#nombreC").val("");
                    $("#descripC").val("");
                });
            });
                </script>
                    <c:if test="${param.accion==null||param.accion=='ingresar'}">
                       <form name="categorias" id="cat" class="contact_form" id="contact_form" method="POST">
                           <div>  
                                <ul>  
                                    <li>  
                                            <h2>Categorias</h2>  
                                        <span class="required_notification">* Datos requeridos</span>  
                                        </li>
                                        <li>  
                                            <input type="hidden" id="nombreC"  name="nombre"  value="CA" id="nombreC" placeholder="Herramientas" required/>
                                        </li>
                                        <li>
                                        <label for="name">Nombre:</label> <input type="text" id="nombre2"  name="nombre2" placeholder="Herramientas" required/>
                                        </li>  
                                        <li>  
                                        <label>Descripción</label> <input type="text" id="descripC"  name="descripC" id="descripC" />
                                        </li>  
                                        <li>
                                        <input type="hidden" name="accion" value="ingresar" />
                                        <button class="submit" type="submit" id="send" onclick="convertir(1);">Enviar</button>
                         <button class="submit" type="reset" id="borrar2">Limpiar</button>
                              </li>  
                                   </ul>  
                        </div>  
                    </form> 
                    </c:if>
                    
                    
                    <c:if test="${param.accion=='editar'}">
                        <h3>Editar Categoria</h3>
                        <sql:query dataSource="jdbc/mysql" var="q1" sql="select*from categoria where idcategoria=${param.id} " />
                        <c:forEach var="item" items="${q1.rows}">
                                <form name="categorias" id="cat" method="POST" class="contact_form" id="contact_form" action="categorialista.jsp">
                                    <div>  
                                <ul>  
                                    <li>  
                                            <h2>Categorias</h2>  
                               <span class="required_notification">* Datos requeridos</span>  
                                        </li>  
                                        <li>  
                                    
                                            <label>Nombre<b>*</b></label> <input type="text" class="redondes" name="nombreC"  id="nombreC" value="${item.nombre_categoria}" required=""/>
                                                </li>  
                                        <li>  
                                    
                                    <label>Descripción</label> <input type="text" class="redondes" name="descripC" id="descripC" value="${item.descripcion_categoria}" required/>
                                        </li>  
                                        <li>  
                                    
                                    <input type="hidden" name="accion" value="editando" />
                                    <input type="hidden" name="id" value="${param.id}" />
                                    
                                    <button class="submit" type="submit" id="send">Enviar</button>
                         <button class="submit" type="submit" id="borrar2">Limpiar</button>
                                       </li>  
                                   </ul>  
                        </div>
                                </form>
                            </c:forEach>
                    </c:if>
                </div>
            </article>
        </section>	
        <aside></aside>
        <footer>
            <div class="ft">
                <p>© 2014 Copyright Suministros Ferreteros. Reservados todos los derechos.</p>
            </div>
        </footer>
        
    </body>
</html>

<jsp:useBean id="cod" scope="page" class="Beans.CodigoBean"/>

<c:if test="${param.accion=='ingresar'}">    
    
    <h2>Datos Ingresados con existo</h2>
    
<c:set var="nombre" value="${param.nombre}"/>
<c:set var="nombre2" value="${param.nombre2}"/>

<sql:query var="q1" dataSource="jdbc/mysql">
SELECT * from categoria
</sql:query>
<c:set var="nreg" value="${q1.rowCount}"/>
<c:set target="${cod}" property="nombre" value="${nombre}"/>
<c:set target="${cod}" property="nombre2" value="${nombre2}"/>
<c:set target="${cod}" property="cantidad_registros" value="${nreg}"/>
<c:set var="codigoUsu" value="${cod.cod}"/>

<%--Nombre:  <c:out value="${nombre} " /><br>
Apellido2:  <c:out value="${nombre2} " /><br>
Codigo:  <c:out value="${codigoUsu} " /><br>  
--%>

<sql:update var="insertar" dataSource="jdbc/mysql">
        INSERT INTO categoria (codigo_categoria,nombre_categoria,descripcion_categoria)values(?,?,?);
        <sql:param value="${codigoUsu}"/>
        <sql:param value="${param.nombre2}"/>
        <sql:param value="${param.descripC}"/>
    </sql:update>
</c:if>
