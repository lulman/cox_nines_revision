<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0" exclude-result-prefixes="tei">
   <xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>
   <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
      <xd:desc>
         <xd:p><xd:b>Created on:</xd:b> Jul 24, 2012</xd:p>
         <xd:p><xd:b>Author:</xd:b>H. Lewis Ulman</xd:p>
         <xd:p></xd:p>
      </xd:desc>
   </xd:doc>
      
 <!-- VARIABLE CSS RULES -->
      
   <xsl:variable name="bodyRule">
      body {
      font-family: Times, 'Times New Roman', serif;
      font-size: 1em;
      width: 800px;
      margin-left: 50px;
      margin-right: 50px;
      margin-top: 100px;
      }
   </xsl:variable>
   <xsl:variable name="navBarRule">
      #navBar {
      position: fixed;
      top: 120px;
      width: 150px;
      float : left;
      text-align : left;
      /* margin-left: 10px; */
      margin-top:0px;
      background-color: rgba(255, 255, 255, 1);
      }
      #viewMenu {
      position: fixed;
      top:120px;
      left: 865px;
      width:150px;
      margin-top: 0px;
      }     
      .close {
      position: absolute;
      top: 90px;
      right: 255px;
      color: #f1f1f1;
      font-size: 36px;
      font-weight: bold;
      transition: 0.3s;
      z-index: 2;
      }
      .description {
      position: absolute;
      top: 90px;
      right: 655px;
      color: #f1f1f1;
      font-size: 16px;
      font-weight: bold;
      transition: 0.3s;
      z-index: 2;
      }
   </xsl:variable>
   <xsl:variable name="maintextRule">
      #maintext {
      float:right;
      width:610px;
      margin-top:35px;
      margin-left:20px;
      padding:5px;
      background-color: rgba(209,209,209, 0.5);
      -webkit-border-radius: 10px;
      -moz-border-radius: 10 px;
      border-radius: 10px;	
      }
   </xsl:variable>
      
   <!-- 
   
   HTML WRAPPER: Note that this section (between the xsl:template tags) 
   places the entire contents enclosed within the TEI Header into 
   the body element of the HTML page. 
   
   -->
   <xsl:template match="/">
      <html>
         <head>
            <!-- Populate meta element with keywords -->
            <xsl:element name="meta">
               <xsl:attribute name="name">keywords</xsl:attribute>
               <xsl:attribute name="content">
                  <xsl:for-each select="//tei:keywords[@scheme='#LCSH']/tei:term">
                     <xsl:choose>
                        <xsl:when test="current()=//tei:keywords[@scheme='#LCSH']/tei:term[1]">
                           <xsl:apply-templates/>
                        </xsl:when>
                        <xsl:otherwise>, <xsl:apply-templates/></xsl:otherwise>
                     </xsl:choose>
                  </xsl:for-each>
               </xsl:attribute>
            </xsl:element>
            <title>
               <xsl:value-of
                  select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
            </title>
            
            <!-- LOCAL JS CALLS -->
            <link rel="stylesheet" href="jquery-ui.css"/>
            <link href="sscox_journal.css" rel="stylesheet" type="text/css" />
            <script src="jquery-1.8.3.min.js"/>
            <script src="jquery-ui-1.9.2.custom.js"/>
                        
            <!-- CALL VARIABLES -->  
            <style>
               <xsl:value-of select="$maintextRule"/>
               <xsl:value-of select="$navBarRule"/>
               <xsl:value-of select="$bodyRule"/>
            </style>
                        
         </head>
         
         <!-- BUILD THE BODY OF THE HTML PAGE -->
         
         <body>
            
            <!-- BUILD THE MENUBAR -->
            <div id="skiptocontent"><a href="#maincontent">skip to main content</a></div>       
            <div class="masthead">
               <div id="navigation">
                  <ul class="nav">
                     <li class="link"><a class="main"  href="./sscox_journal.html#introduction">Historical Introduction</a>
                        <ul class="sub">
                           <li><a href="./sscox_journal.html#crossing">Crossing the Atlantic</a></li>
                           <li><a href="./sscox_journal.html#liverpool">Liverpool</a></li>
                           <li><a href="./sscox_journal.html#london">London</a></li>
                           <li><a href="./sscox_journal.html#paris">Paris and Southern France</a></li>
                           <li><a href="./sscox_journal.html#sardinia">Sardinia and Tuscany</a></li>
                           <li><a href="./sscox_journal.html#rome">"Eternal Rome"</a></li>
                           <li><a href="./sscox_journal.html#orient">The "Dreamy Orient"</a></li>
                           <li><a href="./sscox_journal.html#trieste">Trieste</a></li>
                        </ul>
                     </li>
                     <li class="link"><a class="main"  href="./sscox_journal.html#projectDescription">Editorial Introduction</a>
                        <ul class="sub">
                           <li><a href="./sscox_journal.html#projectDescription">Project Description</a></li>
                           <li><a href="./sscox_journal.html#source">The Source Document</a></li>
                           <li><a href="./sscox_journal.html#edition">The Electronic Edition</a></li>
                           <li><a href="./sscox_journal.html#worksCited">Works Cited</a></li>
                           <li><a href="./sscox_journal.html#peopleMentioned">People Mentioned</a></li>
                           <li><a href="./sscox_journal.html#placesMentioned">Ports of Call</a></li>
                           <li><a href="./sscox_journal.html#revHistory">Revision History</a></li>
                        </ul>
                     </li>
                     <li class="link"><a class="main"  href="">Views of the Journal</a>
                        <ul class="sub">
                           <li><a href="./sscox_journal-by-entry.html">By Journal Entry</a></li>
                           <li><a href="./sscox_journal-by-ms-page.html">By MS Page</a></li>
                           <li><a href="./sscox_journal-combined.html">Facsimile/Text</a></li>
                        </ul>
                     </li>
                     <li class="link"><a class="main"  href="">Appendices</a>
                        <ul class="sub">
                           <li><a href="./appendices-CoxJournalMarkup.html">Markup Guidelines</a></li>
                           <li><a href="./appendices-CoxHand.html">Guide to Cox's Hand</a></li>
                           <li><a href="./appendices-CoxZoomIndex.html">Images of the MS Pages</a></li>
                           <li><a href="./appendices-CoxRestorationHTML5.html">Restoring the MS</a></li>
                           <li><a href="./appendices-CoxTourMaps.html">Maps</a></li>
                           <li><a href="./appendices-Acknowledgements.html">Acknowledgements</a></li>
                           <li><a href="./appendices-aboutEditors.html">About the Editors</a></li>
                        </ul>
                     </li>
                     <li class="link"><a class="main"  href="">Source Files</a>
                        <ul class="sub">
                           <li><a href="./sscox_journal.xml">TEI: Source Markup</a></li>
                           <li><a href="./sscox_Common.xsl">XSL: Base Stylesheet</a></li>
                           <li><a href="./sscox_Diplomatic.xsl">XSL: MS Page View</a></li>
                           <li><a href="./sscox_Reading.xsl">XSL: Entry View</a></li>
                           <li><a href="./sscox_CombinedView.xsl">XSL: Text/Facs View</a></li>
                           <li><a href="./sscox_Edintro.xsl">XSL: Ed. Intro</a></li>
                           <li><a href="./sscox_journal.css">CSS: Style Sheet</a></li>
                           <li><a href="./sscox_Current.odd.txt">ODD: TEI Customization</a></li>
                           <li><a href="./sscox_Current.rnc.txt">RNC: Schema</a></li>
                        </ul>
                     </li>
                  </ul> <!-- End ul class nav -->
               </div> <!-- End div id navigation -->
               
               <div id="titleBar">
                  <p style="text-align: center"><span class="projectTitle">Journal of a Tour to Europe</span><br/>by Samuel Sullivan Cox</p>
                  <hr style="border: 2px solid crimson;"/>
               </div> <!-- END titleBar -->
            </div> <!-- END masthead -->
       
            <!-- BUILD THE VERTICAL IMAGE BAR -->
       
            <div id="navBar">
                
               <div id="display1"><!-- Begin display1 -->
                  <button class="modalb" id="b1"><img id="myImg1" src="image_sscox_portrait.jpg" alt="Portrait of Samuel Sullivan Cox (undated). Frontispiece. Cox and Northrup, 1899." title="Portrait of Samuel Sullivan Cox (undated)" width="100"/></button>
                     <div id="myModal1" class="modal">
                        <a href="image_sscox_portrait_longdesc.html" class="description">[Description]</a><br/>
                        <button class="modalb close" onclick="document.getElementById('myModal1').style.display='none'">[Close]</button>
                        <img class="modal-content" id="img1" src="image_sscox_portrait.jpg" alt="Portrait of Samuel Sullivan Cox (undated). Frontispiece. Cox and Northrup, 1899"/>
                        <div id="caption1">
                           Portrait of Samuel Sullivan Cox (undated)<br>Frontispiece. Cox and Northrup, 1899</br>
                        </div>
                     </div> <!-- End myModal1 -->
               </div> <!-- End display1 -->
               
               <!-- Begin display2 -->
               <div id="display2">
                  <button class="modalb" id="b2"><img id="myImg2" src="image_sscox_1854_DecorativeTitle.jpg" alt="Decorative Title Page from A Buckeye Abroad (1854)." title="Decorative Title Page from A Buckeye Abroad (1854)" width="100"/></button>
                  <div id="myModal2" class="modal">
                     <a href="image_sscox_1854_DecorativeTitle_longdesc.html" class="description">[Description]</a><br/>
                     <button class="modalb close" onclick="document.getElementById('myModal2').style.display='none'">[Close]</button>
                     <img class="modal-content" id="img2" src="image_sscox_1854_DecorativeTitle.jpg" alt="Decorative Title Page from A Buckeye Abroad (1854)"/>
                     <div id="caption2">
                        Decorative Title Page<br>from <cite>A Buckeye Abroad</cite>. Cincinnati: Moore, Anderson, 1854</br>
                     </div>
                  </div> <!-- End myModal2 -->
                  <script>		
                     // Get the second modal
                     var modal2 = document.getElementById('myModal2');
                     
                     // Get the image and insert it inside the modal - use its "alt" text as a caption
                     var img2 = document.getElementById('b2');
                     var modalImg2 = document.getElementById("img2");
                     var captionText2 = document.getElementById("caption2");
                     img2.onclick = function(){
                     modal2.style.display = "block";
                     modalImg2.src = this.img.src;
                     captionText2.innerHTML = this.alt;
                     }
                     
                      // Get the span element that closes the modal 
                        var span = document.getElementsByClassName("close")[0];
                        
                        // When the user clicks on span (x), close the modal 
                           span.onclick = function() {
                           modal2.style.display = "none";
                           }
                  </script>
               </div> <!-- End display2 -->
               
               <!-- Begin display3 -->         
               <div id="display3">
                  <button class="modalb" id="b3"><img id="myImg3" src="image_sscox_rmsAsia.jpg" alt="Royal Mail Steam Ship Asia. New York: N. Currier, 1851" title="Royal Mail Steam Ship Asia" width="100"/></button>
                     <div id="myModal3" class="modal">
                        <a href="image_sscox_rmsAsia_longdesc.html" class="description">[Description]</a><br/>
                        <button class=" modalb close" onclick="document.getElementById('myModal3').style.display='none'">[Close]</button>
                        <img class="modal-content" id="img3" src="image_sscox_rmsAsia.jpg" alt="Royal Mail Steam Ship Asia. New York: N. Currier, 1851"/>
                        <div id="caption3">
                           Royal Mail Steamship Asia<br/>New York: N. Currier, 1851<br>Library of Congress https://www.loc.gov/pictures/item/2001704213/</br>
                        </div>
                     </div> <!-- End myModal3 -->
                     <script>
                        
                        // Get the modal
                        var modal3 = document.getElementById('myModal3');
                        
                        // Get the image and insert it inside the modal - use its "alt" text as a caption
                        var img3 = document.getElementById('b3');
                        var modalImg3 = document.getElementById("img3");
                        var captionText3 = document.getElementById("caption3");
                        img3.onclick = function(){
                        modal3.style.display = "block";
                        modalImg3.src = this.img.src;
                        captionText3.innerHTML = this.alt;
                        }
                        
                        // Get the span element that closes the modal
                           var span = document.getElementsByClassName("close")[0];
                           
                           // When the user clicks on span (x), close the modal
                              span.onclick = function() {
                              modal3.style.display = "none";
                              }
                     </script>
               </div> <!-- End display3 -->
               
               <!-- Begin display4 -->
               
               <div id="display4">
                  <button class="modalb" id="b4"><img id="myImg4" src="image_sscox_illus_PoetsCorner.jpg" alt="Poet's Corner, Westminster Abbey. Illustration from A Buckeye Abroad (1854)" title="Poet's Corner, Westminster Abbey. Illustration from A Buckeye Abroad (1854)" width="100"/></button>
                     <div id="myModal4" class="modal">
                        <a href="image_sscox_illus_PoetsCorner_longdesc.html" class="description">[Description]</a><br/>
                        <button class="modalb close" onclick="document.getElementById('myModal4').style.display='none'">[Close]</button>
                        <img class="modal-content" id="img4" src="image_sscox_illus_PoetsCorner.jpg" alt="Poet's Corner, Westminster Abbey. Illustration from A Buckeye Abroad (1854)."/>
                        <div id="caption4">
                           Poet's Corner, Westminster Abbey.<br/>Illustration from <cite>A Buckeye Abroad</cite><br/>Cincinnati: Moore, Anderson, 1854.
                        </div> <!-- End myModal4 -->
                        <script>
                           
                           // Get the modal
                           var modal4 = document.getElementById('myModal4');
                           
                           // Get the image and insert it inside the modal - use its "alt" text as a caption
                           var img4 = document.getElementById('b4');
                           var modalImg4 = document.getElementById("img4");
                           var captionText4 = document.getElementById("caption4");
                           img4.onclick = function(){
                           modal4.style.display = "block";
                           modalImg4.src = this.img.src;
                           captionText4.innerHTML = this.alt;
                           }
                           
                           // Get the span element that closes the modal
                              var span = document.getElementsByClassName("close")[0];
                              
                              // When the user clicks on span (x), close the modal
                                 span.onclick = function() {
                                 modal4.style.display = "none";
                                 }
                        </script>
                     </div> <!-- End modal4 -->
               </div> <!-- End display 4 -->
                     
                     <!-- Begin display5 -->
                     
                     <div id="display5">
                        <button class="modalb" id="b5"><img id="myImg5" src="image_sscox_illus_Pompeii.jpg" alt="A Villa in Pompeii. Illustration from A Buckeye Abroad (1854)" title="A Villa in Pompeii. Illustration from A Buckeye Abroad (1854)" width="100"/></button>
                           <div id="myModal5" class="modal">
                              <a href="image_sscox_illus_Pompeii_longdesc.html" class="description">[Description]</a><br/>
                              <button class="modalb close" onclick="document.getElementById('myModal5').style.display='none'">[Close]</button>
                              <img class="modal-content" id="img5" src="image_sscox_illus_Pompeii.jpg" alt="A Villa in Pompeii. Illustration from A Buckeye Abroad (1854) "/>
                              <div id="caption5">
                                 A Villa in Pompeii<br/>Illustration from <cite>A Buckeye Abroad</cite> <br/>Cincinnati: Moore, Anderson, 1854
                              </div>
                           </div> <!-- End myModal5 -->
                           <script>
                              
                              // Get the modal
                              var modal5 = document.getElementById('myModal5');
                              
                              // Get the image and insert it inside the modal - use its "alt" text as a caption
                              var img5 = document.getElementById('b5');
                              var modalImg5 = document.getElementById("img5");
                              var captionText5 = document.getElementById("caption5");
                              img5.onclick = function(){
                              modal5.style.display = "block";
                              modalImg5.src = this.img.src;
                              captionText5.innerHTML = this.alt;
                              }
                              
                              // Get the span element that closes the modal
                                 var span = document.getElementsByClassName("close")[0];
                                 
                                 // When the user clicks on span (x), close the modal
                                    span.onclick = function() {
                                    modal5.style.display = "none";
                                    }
                           </script>
                     </div> <!-- End display5 -->
                     <script>
                        // Get the first modal
                        var modal1 = document.getElementById('myModal1');
                        
                        // Get the image and insert it inside the modal - use its "alt" text as a caption
                        var img1 = document.getElementById('b1');
                        var modalImg1 = document.getElementById("img1");
                        var captionText1 = document.getElementById("caption1");
                        img1.onclick = function(){
                        modal1.style.display = "block";
                        modalImg1.src = this.img.src;
                        captionText1.innerHTML = this.alt;
                        }
                        
                        // Get the span element that closes the modal
                           var span = document.getElementsByClassName("close")[0];
                           
                           // When the user clicks on span (x), close the modal
                              span.onclick = function() {
                              modal1.style.display = "none";
                              }
                     </script>

            </div> <!-- End div id NavBar -->
            
            <!-- END THE VERTICAL IMAGE BAR -->
            <!-- START RIGHT MENU -->   
            <div id="viewMenu">
               <p class="aboutView"><a href="./sscox_journal.html#view">About this page.</a></p>
               <div class="container">
                  <p class="font-size-label">Font Size <button id="up">+</button> <button id="down">-</button></p>
                  <!--<p id="font-size"></p>-->
                  <p style="font-size:smaller">
                     <strong>Edited by</strong><br/>
                     Andrea Avenido<br/>
                     Puja Batra-Wells<br/>
                     MariaTeresa Beltran-Aponte<br/>
                     Karen M. Beyer<br/>
                     Mike Bubenik<br/>
                     Frances Caroline Buschur<br/>
                     Johaun Cheng<br/>
                     Katrina F. Cook<br/>
                     Bill W. Dantowitz<br/>
                     Envera Dukaj<br/>                     
                     Sam Eilerman<br/>
                     Nate Ellis<br/>
                     Rachel Fouch<br/>
                     Brian Keller<br/>
                     Riley Lease<br/>
                     Mike Liddy<br/>
                     Nick Long<br/>
                     Jennifer Lee Schneider<br/>
                     H. Lewis Ulman<br/>
                     Victoria R. Urban<br/>
                     Derrick Whan<br/>
                     Derek Craig Zoladz<br/>
                  </p>
                  <!-- Start NINES Widget -->
                  <form method="get"
                     style="font-size-adjust:none;font-style:normal;font-variant:normal;font-weight:normal;line-height:1.231;color:#000000;"
                     action="http://www.nines.org/search">
                     <div
                        style="background:url(image-widget_tower_white.jpg) no-repeat scroll left top;height:56px;width:157px;font-size:12px;margin:0;padding:125px 0 0 22px;text-align:left;font-family:'Times New Roman',Times,serif;font-size-adjust:none;font-style:normal;font-variant:normal;font-weight:normal;line-height:1.231;color:#000000;">
                        <a href="http://nines.org"
                           style="text-decoration:none; float:left; margin-top:-125px; height:120px; width:120px;"
                           >&#160;</a>
                        <input type="text" name="q" onclick="this.form.target='_blank';return true;"
                           size="16" maxlength="255" value=""
                           style="width:100px;-x-system-font:none;font-family:arial,helvetica,clean,sans-serif;font-size-adjust:none;font-stretch:normal;font-style:normal;font-variant:normal;font-weight:normal;line-height:normal;margin:0;margin-top:3px;margin-bottom:5px;padding:0;text-align:left;color:#000000;" />
                        <input type="submit" value="Search NINES"
                           style="width:100px;padding:1px;-x-system-font:none;font-family:arial,helvetica,clean,sans-serif;font-size:99%;font-size-adjust:none;font-stretch:normal;font-style:normal;font-variant:normal;font-weight:normal;line-height:normal;margin:0;margin-left:7px;text-align:left;color:#000000;"
                        />
                     </div>
                  </form>
                  <!-- End NINES Widget -->
                  <!-- END RIGHT MENU -->
               </div> <!-- End div class "container" -->
            </div> <!-- End div id "View Menu" -->
              
   <xsl:element name="div">
   <xsl:attribute name="id">maintext</xsl:attribute>
      <xsl:element name="div"><xsl:attribute name="id">maincontent</xsl:attribute></xsl:element>
      
            <!-- Order and apply templates for the sections of the header you wish to include. -->
      
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='introductory']"/>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:projectDesc"/>
            <xsl:apply-templates
               select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='descriptive']"/>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt"/>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt"/>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:editorialDecl"/>
      
<!--     THIS INFO IS COVERED IN THE EDITORIAL DECLARATION         
         <xsl:apply-templates select="/tei:teiCorpus/tei:teiHeader/tei:encodingDesc/tei:refsDecl"/>
-->      
      
      <hr style="border: 2px solid crimson;"/>
      <h2 id="worksCited">List of Works Cited</h2>
      <hr/>
      <xsl:apply-templates
               select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listBibl"/>
      <hr style="border: 2px solid crimson;"/>
      <h2>Appendices</h2> 
             <xsl:apply-templates
               select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson"/>
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listOrg"></xsl:apply-templates>
            <xsl:apply-templates
               select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace"/>
      <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:list[@type='ships']"></xsl:apply-templates>
      <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listEvent"></xsl:apply-templates>
      
            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:revisionDesc"/>
      <hr style="border: 2px solid crimson;"/>
      <h2>About this Editorial Introduction</h2>
      <hr/>
            <p><a id="view"/>Text on this page is derived from the
               edition's XML source document <a href="sscox_journal.xml">sscox_journal.xml</a>, transformed
               with the XSL style sheet <a href="sscox_Edintro.xsl">sscox_Edintro.xsl</a>.</p>
            <hr/>
      <p>&#x2192; <a href="./sscox_journal-by-entry.html">Link to the text of the journal</a>.
            </p>
   </xsl:element> <!-- END maintext -->
            <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
            <script src="index.js"></script>
         </body>

         <!-- Change text size script here?? -->         

      </html>
   </xsl:template>
   
   <!-- Format the introductory notes. -->
      
   <xsl:template match="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='introductory']">
      <h2 id="introduction">Introduction</h2>
      <hr/>
      <xsl:apply-templates/>
   </xsl:template>
   
   <!-- Format information about the source document. -->
      
   <xsl:template
      match="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:notesStmt/tei:note[@type='descriptive']">
      <hr style="border: 2px solid crimson;"/>
      <h2 id="source">About the Source Document</h2>
      <hr/>
      <p><strong>Title</strong>: "<xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:title"/>" 
         <br/><strong>Extent</strong>: <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:extent"/>
      </p>
         <xsl:apply-templates/>
   </xsl:template>
   
   <xsl:template match="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:refsDecl">
<hr/>
      <hr style="border: 2px solid crimson;"/>
      <h2>Encoding Conventions</h2>
      <hr/>
      <xsl:apply-templates/>
      <hr style="border: 2px solid crimson;"/>
      <h2>License</h2>
      <hr/>
      <p style="text-align: left">
         <xsl:value-of
            select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/tei:p[@xml:id='CreativeCommons']"
            disable-output-escaping="yes"/>
      </p>      
   </xsl:template>
   
   <xsl:template match="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability">
            <xsl:apply-templates/>
<!--      <p>
         <em>
            <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:pubPlace"/>, <xsl:value-of
               select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/>.
         </em>
      </p>-->
   </xsl:template>

   <!-- Format information about the electronic document. -->
      
   <xsl:template match="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:projectDesc">
      <hr style="border: 2px solid crimson;"/>
      <h2 id="projectDescription">Project Description</h2>
      <hr/>
         <xsl:apply-templates/>
   </xsl:template>
   
   <xsl:template match="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt">
      <hr style="border: 2px solid crimson;"/>
      <h2 id="edition">About the Electronic Edition</h2>
      <hr/>
      <p><strong>Preferred Citation</strong>: <xsl:value-of select="tei:title"/></p>
         <p><strong>Editors</strong>: <xsl:for-each select="tei:editor">
            <xsl:choose>
               <xsl:when test="current()=//tei:editor[1]">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>, <xsl:apply-templates/></xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>.</p>
      <xsl:for-each select="tei:respStmt">
         <p>
      <strong><xsl:value-of select="tei:resp"/></strong>
      <xsl:for-each select="tei:persName">
            <xsl:choose>
               <xsl:when test="current()=//tei:respStmt/tei:persName[1]">
                  <xsl:apply-templates/>
               </xsl:when>
               <xsl:otherwise>, <xsl:apply-templates/></xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>.
         </p>
      </xsl:for-each>
      <p style="text-align: left">
         <xsl:value-of
            select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/tei:p[@xml:id='CreativeCommons']"
            disable-output-escaping="yes"/>
      </p>      
    </xsl:template>
   
   <xsl:template match="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:editorialDecl">
      <hr style="border: 2px solid crimson;"/>
      <h2>Editorial Method</h2>
      <hr/>
      <xsl:apply-templates/>
   </xsl:template>
   
   <!-- SORTING AND FORMATTING LISTS OF WORKS CITED, PLACES, ORGANIZATIONS, AND SO ON. -->
   
   <xsl:template match="tei:listBibl">
      <xsl:for-each select="tei:bibl">
         <xsl:sort select="@n"/>
         <p class="hang25"><a>
            <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute></a>
            <xsl:apply-templates/></p>
      </xsl:for-each>
   </xsl:template>
   
   <xsl:template match="tei:listPerson[@type='mentioned']">
      <hr/>
      <h3 id="peopleMentioned">List of People Mentioned in Cox's Diary</h3>
      <xsl:apply-templates select="tei:head"/>
      <xsl:for-each select="tei:person">
         <xsl:sort select="@xml:id"/>
         <p>
            <strong><xsl:value-of select="tei:persName"/></strong>
            <xsl:if test="tei:birth or tei:death">
               <xsl:choose>
                  <xsl:when test="tei:birth[@notAfter]"> (b. not before <xsl:value-of select="tei:birth/@notAfter"/></xsl:when>
                  <xsl:when test="tei:birth[@when]"> (b. <xsl:value-of select="tei:birth/@when"/></xsl:when>
                  <xsl:otherwise> (</xsl:otherwise></xsl:choose>
               <xsl:choose>
                  <xsl:when test="not(tei:birth)"></xsl:when>
                  <xsl:when test="not(tei:death)"></xsl:when>
                  <xsl:otherwise>; </xsl:otherwise>
               </xsl:choose>
               <xsl:choose>
                  <xsl:when test="tei:death[@notBefore]">d. not before <xsl:value-of select="tei:death/@notBefore"/></xsl:when>
                  <xsl:when test="tei:death[@when]">d. <xsl:value-of select="tei:death/@when"/></xsl:when>
                  <xsl:otherwise></xsl:otherwise></xsl:choose>)</xsl:if>.
          <xsl:apply-templates select="tei:note[@type='biographical']"/>
         </p>
      </xsl:for-each>
   </xsl:template>
   
<!--   NOT USED IN THIS EDITION      
      <xsl:template match="tei:listOrg">
         <hr/>
      <h3 id="organizationsMentioned">List of Organizations Mentioned in Samuel Sullivan Cox's Diary</h3>
         <xsl:apply-templates select="tei:head"/>
         <xsl:for-each select="tei:org">
         <xsl:sort select="tei:orgName[1]"/>
         <p>
            <strong><xsl:value-of select="tei:orgName"/></strong>:
            <xsl:apply-templates select="tei:desc"/>
         </p>
      </xsl:for-each>
   </xsl:template>
-->   
   
<!--   <xsl:template match="tei:listPerson[@type='editors']"/>  -->  
   
      <xsl:template match="tei:listPlace">
         <hr/>
      <h3 id="placesMentioned">List of Major Landmarks and Ports of Call Visited During Cox's Tour</h3>
         <xsl:apply-templates select="tei:head"/>
         <table style="width:610px; padding:5px; border:none;">
            <tr>
               <td style="white-space: nowrap; border:none;">
                  <h2>Date</h2>
               </td>
               <td style="border:none;">
                  <h2>Port of Call</h2>
               </td>
            </tr>
            <xsl:for-each select="tei:place">
               <tr style="vertical-align:top">
                  <td style="white-space: nowrap; border:none;">
                     <xsl:element name="a"><xsl:attribute name="target">blank</xsl:attribute><xsl:attribute name="href">./sscox_journal-by-entry.html<xsl:value-of select="tei:event/@source"/></xsl:attribute><xsl:value-of select="tei:event"/></xsl:element>
                  </td>
                  <td style="border:none;">
                     <xsl:apply-templates select="tei:desc"/>
                  </td>
               </tr>
            </xsl:for-each>
         </table>         

         <!-- HANDLED DIFFERENTLY FOR THE COX EDITION
       <xsl:for-each select="tei:place">
         <xsl:sort select="tei:geogName"/>
         <xsl:sort select="tei:placeName[1]"/>
         <p>
            <xsl:if test="tei:geogName[1]"><strong><xsl:value-of select="tei:geogName[1]"/></strong></xsl:if>
            <xsl:if test="tei:geogName[2]"> (<xsl:value-of select="tei:geogName[2]"/>)</xsl:if>
            <xsl:if test="tei:placeName[1]"><strong><xsl:value-of select="tei:placeName[1]"/></strong></xsl:if>
            <xsl:if test="tei:placeName[2]"> (<xsl:value-of select="tei:placeName[2]"/>)</xsl:if>.
            <xsl:value-of select="tei:country"/> 
            <xsl:if test="tei:region">; <xsl:value-of select="tei:region"/></xsl:if>
            <xsl:if test="tei:location/tei:geo"> (Lat/Long: 
               <xsl:value-of select="tei:location/tei:geo"/>)</xsl:if>. 
            <xsl:value-of select="tei:desc"/>
         </p>
      </xsl:for-each>
-->   </xsl:template>
   
<!--   NOT USED IN THIS EDITION 
      <xsl:template match="tei:list[@type='ships']">
      <hr/>
      <h3 id="shipsMentioned">List of Ships Mentioned in Samuel Sullivan Cox's Diary</h3>
      <xsl:apply-templates select="tei:head"/>
      <xsl:for-each select="tei:item">
         <xsl:sort select="tei:name[1]"/>
         <p>
            <strong><xsl:value-of select="tei:name"/></strong>. 
            <xsl:if test="tei:persName[@type='Captain']">
               Captain: <xsl:value-of select="tei:persName"/>
            </xsl:if>
         </p>
      </xsl:for-each>
   </xsl:template>
-->   
   

<!--  NOT USED IN THIS EDITION
      <xsl:template match="tei:listEvent">
      <h3 id="OrganizationsMentioned">List of Notable Events Mentioned in Lucius Smith's Diary</h3>
      <xsl:for-each select="tei:event">
         <xsl:sort select="tei:event[1]/@when"/>
         <p>
            <strong><xsl:value-of select="tei:label"/></strong>:
            <xsl:apply-templates select="tei:desc"/>
         </p>
      </xsl:for-each>
   </xsl:template>
-->
   <!-- Format information about the revision history of the document. -->
      
   <xsl:template match="tei:TEI/tei:teiHeader/tei:revisionDesc">
      <hr style="border: 2px solid crimson;"/>
         <h2 id="revHistory">Revision History</h2>
      <table style="width:90%; padding:5px">
         <tr>
            <td>
               <h2>Date</h2>
            </td>
            <td>
               <h2>Name</h2>
            </td>
            <td>
               <h2>Change</h2>
            </td>
         </tr>
         <xsl:for-each select="tei:change">
            <xsl:variable name="ID"><xsl:value-of select="@who"/></xsl:variable>
            <tr class="revTable" style="vertical-align:top">
               <td style="white-space: nowrap">
                  <xsl:value-of select="tei:date"/>
               </td>
               <td style="white-space: nowrap">
                  <!--            OLD CODE             
                <xsl:value-of select="//tei:listPerson[@type='editors']/tei:person[@xml:id=$ID]/tei:persName"></xsl:value-of>
-->               
               <xsl:value-of select="tei:name"/>
               </td>
               <td>
                  <xsl:value-of select="text()"/>
               </td>
            </tr>
         </xsl:for-each>
      </table>
      <p></p>
   </xsl:template>

   <!-- Format miscellaneous elements -->
   <xsl:template match="tei:sic">
      <xsl:apply-templates/> [<xsl:element name="span"><xsl:attribute name="style">font-style: italic;</xsl:attribute>sic</xsl:element>]
   </xsl:template>
   <xsl:template match="tei:lb"><br/></xsl:template>
   <xsl:template match="tei:fileDesc/tei:titleStmt/tei:title/tei:lb">
      <br/><xsl:apply-templates/>
   </xsl:template>   
   <xsl:template match="tei:p[@rend='h3']">
      <xsl:element name="h3">
         <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="//tei:p[not(@xml:id='CreativeCommons') and not(@rend='h3')]">
      <p>
         <xsl:apply-templates/>
      </p>
   </xsl:template>
   <xsl:template match="tei:q[@rend='block']">
      <div class="blockquote">
         <xsl:apply-templates/>
       <br/>
      </div>
   </xsl:template>
   <xsl:template match="tei:quote[@rend='blockquote']">
      <br/>
      <div class="blockquote">
         <xsl:apply-templates/>
         <br/>
      </div>
   </xsl:template>
   <xsl:template match="tei:quote[@rend='epigraph']">
      <div class="epigraph">
         <xsl:apply-templates/>
         <br/>
      </div>
   </xsl:template>
   <xsl:template match="tei:name">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tei:name[@type='ship']">
      <xsl:element name="span"><xsl:attribute name="style">font-style:italic;</xsl:attribute>
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="tei:name[@type='binomial']">
      <xsl:element name="span"><xsl:attribute name="style">font-style:italic;</xsl:attribute>
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="tei:foreign">
      <xsl:element name="span"><xsl:attribute name="style">font-style:italic;</xsl:attribute>
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="tei:hi[@rend='bold']">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="tei:hi[@rend='italics']">
      <em>
         <xsl:apply-templates/>
      </em>
   </xsl:template>
   <xsl:template match="tei:emph[@rend='bold']">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="emph[@rend='italics']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="emph[@rend='italic']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="emph[@rend='underline']">
      <U>
         <xsl:apply-templates/>
      </U>
   </xsl:template>
   <xsl:template match="emph[@rend='sup']">
      <sup>
         <xsl:apply-templates/>
      </sup>
   </xsl:template>
   <xsl:template match="tei:q">
      "<xsl:apply-templates/>"
   </xsl:template>
   <xsl:template match="//tei:note[@type='introductory' or 'biographical']//tei:bibl">(<xsl:apply-templates/>)</xsl:template>
   <xsl:template match="tei:title[@level='a']">"<xsl:apply-templates/>"</xsl:template>
   <xsl:template match="tei:title[@level='m']"><cite><xsl:apply-templates/></cite></xsl:template>
   <xsl:template match="tei:title[@level='j']">
      <cite>
         <xsl:apply-templates/>
      </cite>
   </xsl:template>   
   <xsl:template match="tei:date"/>
   

   <!-- LINK OR EMBED IMAGES AND OTHER NON-TEXTUAL MATERIALS -->
      
   <xsl:template match="tei:figure[@rend='link']"> 
      <a>
         <xsl:attribute name="HREF">
            <xsl:value-of select="tei:graphic/@url"/>
         </xsl:attribute>
         <xsl:attribute name="alt">
            <xsl:value-of select="tei:figDesc"/>
         </xsl:attribute>
         <xsl:attribute name="target">blank</xsl:attribute>
         <xsl:value-of select="tei:head"/>
      </a></xsl:template>
   <xsl:template match="tei:figure[@rend='embed']">
      <div class="fl_img_right">
         <img>
            <xsl:attribute name="src">
               <xsl:value-of select="tei:graphic/@url"/>
            </xsl:attribute>
            <xsl:attribute name="alt">
               <xsl:value-of select="tei:figDesc"/>
            </xsl:attribute>
            <xsl:if test="@n">
               <xsl:attribute name="width">
                  <xsl:value-of select="@n"/>
               </xsl:attribute>
            </xsl:if>
         </img>
         <br/>
         <xsl:value-of select="tei:head"/>
      </div>
   </xsl:template> 
  
   <!-- Suppress some unused elements in the XML file. -->
      
   <xsl:template match="tei:text"/>
   <xsl:template match="tei:editor"/>
   <xsl:template match="tei:principal"/>
   <xsl:template match="tei:editionStmt"/>
   <xsl:template match="tei:extent"/>
   <xsl:template match="tei:encodingDesc"/>
   <xsl:template match="tei:profileDesc"/>
   <xsl:template match="tei:idno"/>
   <xsl:template match="tei:publisher"/>
   <xsl:template match="tei:pubPlace"/>
   <xsl:template match="tei:publicationStmt/tei:date"></xsl:template>
   <xsl:template match="tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/tei:p[@xml:id='CreativeCommons']"/>
</xsl:stylesheet>
