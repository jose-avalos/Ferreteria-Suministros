<%@include file="/recursos/header_empleado.jsp" %>

<title>Empleado</title>

<style>
        #categoria{padding-left: 7.5Ex;}
        a:link   {   text-decoration:none;   }  
        #gear{margin-left: 20Ex;}
#words {
    margin-left: auto;
    margin-right: auto;
    width: 100%;
    margin-top:1Ex;
    font-style: oblique;
    font-size:2em;
    font-color:white;
    padding-left:20Ex;  }
        </style>
        
    <body>        
        <%@include file="/recursos/menu_empleado.jsp" %>
                
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
<br>
                Empleado
                
                <div>
                    <img id="gear" src="img/ferreteria.jpg" align="center" ALT="Suministros Ferreteros">
                </div>>
            </article>	
        </section>	
        <aside></aside>

        <footer>
            <div class="ft">
                <p>� 2014 Copyright Suministros Ferreteros. Reservados todos los derechos.</p>
            </div>
        </footer>
        
    </body>
</html>
