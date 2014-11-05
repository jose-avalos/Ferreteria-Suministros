<%@include file="/recursos/header.jsp" %>

<title>Productos</title>
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
        </script>
        
        <article>
                <script type="text/javascript">
            $(function() { 
                $("#cat").validity(function() {
                    $.validity.patterns.nombre = /^[\S][\w\s-Ò—.]{0,}[\S]$/;
                    $.validity.messages.nombre ="<p>-No se aceptan simbolos (%$#!)</p><p>-No espacios al Inicio ni Final</p><p>-Dos letras como minimo</p>";
                    $.validity.patterns.descripcion = /^[\S][\w\s-Ò—@#$%&=+-.]{0,}[\S]$/;
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
                       <form name="productos" id="cat" class="contact_form" id="contact_form" method="POST">
                           <div>  
                                <ul>  
                                    <li>  
                                            <h2>Producto</h2>  
                                        <span class="required_notification">* Datos requeridos</span>  
                                        </li>  
                                        <li>  
                                        <label for="nombre">Nombre Producto:</label> <input type="text" id="nombreP"  name="nombreP" id="nombreP" placeholder="Martillo" required/>
                                        </li>  
                                        <li>
                                        <label>Cantidad</label> <input type="number" id="cantidadP"  name="cantidadP" id="cantidadP" required required pattern='[0-9].[0-9]' />
                                        </li>  
                                        <li>
                                        <label>Costo</label> <input type="number" id="costoP"  name="costoP" id="costoP" required required pattern='[0-9]'/>
                                        </li>  
                                        <li>
                                        <input type="hidden" name="accion" value="ingresar" />
                         <button class="submit" type="submit" id="send">Enviar</button>
                         <button class="submit" type="button" id="borrar2">Limpiar</button>
                              </li>  
                                   </ul>  
                        </div>  
                    </form> 
                    </c:if>
                    
                    
                    <c:if test="${param.accion=='editar'}">
                        <h3>Editar Productos</h3>
                        <sql:query dataSource="jdbc/mysql" var="q1" sql="select*from productos_de_compra where idcategoria=${param.id} " />
                        <c:forEach var="item" items="${q1.rows}">
                                <form name="productos" id="cat" method="POST" class="contact_form" id="contact_form" action="productosLista.jsp">
                                    <div>  
                                <ul>  
                                    <li>  
                                            <h2>Productos</h2>  
                               <span class="required_notification">* Datos requeridos</span>  
                                        </li>  
                                        <li>  
                                    
                                            <label>Nombre <b>*</b></label> <input type="text" class="redondes" name="nombreP" id="nombreP" value="${item.nombre_producto}" required/>
                                                </li>  
                                        <li>  
                                    
                                    <label>Cantidad</label><b>*</b> <input type="text" class="redondes" name="cantidadP" id="cantidadP" value="${item.cantidad_producto}" required pattern='[0-9].[0-9]'/>
                                        </li>  
                                        <li>  
                                    <label>Costos</label><b>*</b> <input type="text" class="redondes" name="cantidadP" id="cantidadP" value="${item.costo_producto}" required pattern='[0-9].[0-9]'/>
                                        </li>  
                                        <li>  
                                    
                                    <input type="hidden" name="accion" value="editando" />
                                    <input type="hidden" name="id" value="${param.id}" />
                                        <button type="submit" id="send" >Guardar</button>
                                        <button type="button" id="borrar2" >Limpiar</button>
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

<c:if test="${param.accion=='ingresar'}">
    <sql:update var="insertar" dataSource="jdbc/mysql">
        INSERT INTO productos_de_compra (nombre_productos_de_compra,cantidad_productos_de_compra,costo_productos_de_compra)values(?,?,?);
        <sql:param value="${param.nombreP}"/>
        <sql:param value="${param.cantidadP}"/>
        <sql:param value="${param.costoP}"/>
    </sql:update>
</c:if>
