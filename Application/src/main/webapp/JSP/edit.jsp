<%--
  Created by IntelliJ IDEA.
  User: thibom
  Date: 20/10/16
  Time: 06:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Projet MULTIMIF - Editeur</title>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.1.3/js.cookie.js"></script>
        <script src="https://mbraak.github.io/jqTree/tree.jquery.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css" type="text/css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>

        <!-- Asciinema -->
        <link rel="stylesheet" href="../asciinema/asciinema-player.css" type="text/css">
        <script src="../asciinema/asciinema-player.js"></script>

        <link rel="stylesheet" href="https://mbraak.github.io/jqTree/jqtree.css" type="text/css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" type="text/css" href="../ressources/CSS/edit.css">
        <link href="../ressources/img/favicon.png" rel="icon" type="image/x-icon" />
        <!--[if lt IE 9]>
        <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <!-- Code Mirror -->
        <script src="../codeMirror/lib/codemirror.js"></script>
        <link rel="stylesheet" href="../codeMirror/lib/codemirror.css">
        <link rel="stylesheet" href="../codeMirror/theme/night.css">
        <link rel="stylesheet" href="../codeMirror/theme/dracula.css">
        <link rel="stylesheet" href="../codeMirror/theme/solarized.css">
        <link rel="stylesheet" href="../codeMirror/theme/rubyblue.css">
        <script src="../codeMirror/mode/clike/clike.js"></script>

        <!-- Script perso -->
        <script src="../ressources/JS/api.js"></script>
        <script src="../ressources/JS/git.js"></script>
        <script src="../ressources/JS/editAjax.js"></script>

    </head>
    <body>
        <header>
            <nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
                <div class="container-fluid">
                    <!-- Pour navigation mobile -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>

                    <!-- Pour navigation ordinateur -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="home.jsp">Home</a></li>
                            <li class="active"><a href="edit.jsp">Edition</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a id="deconnexion" href="#">Deconnexion</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <main class="container-fluid">
            <div class="col-lg-10 col-lg-offset-1">
                <ol class="breadcrumb">
                    <li>Branche: <span id="branche-breadcrumb"></span></li>
                    <li>Revision: <span id="revision-breadcrumb"></span></li>
                    <li>Fichier: <span id="file-breadcrumb"></span></li>
                </ol>
            </div>

            <aside class="row">
                <div class="col-lg-10 col-lg-offset-1" id="barreBtn">
                    <div class="btn-group">
                        <select class="form-control" id="changerTheme">
                            <option value="dracula">Dracula</option>
                            <option value="night">Night</option>
                            <option value="rubyblue">RubyBlue</option>
                            <option value="solarized">Solarized</option>
                        </select>
                    </div>
                    <div class="btn-group">
                        <select class="form-control" id="tauxIndentation">
                            <option value="1">Indentation 1</option>
                            <option value="2">Indentation 2</option>
                            <option value="3">Indentation 3</option>
                            <option value="4">Indentation 4</option>
                            <option value="5">Indentation 5</option>
                        </select>
                    </div>
                    <div class="btn-group">
                        <select class="form-control" id="selectBranch">
                            <option value="">Branche</option>
                      
                        </select>
                    </div>

                    <div class="btn-group">
                        <button type="button" class="btn btn-default" id="btnAutoIndent">Tout Indenter</button>
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-plus" aria-hidden="true"></i>
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li class="ligneBtnCreer" id="btnCreerFichier" data-toggle="modal" data-target="#fenetreFichier"><a><i class="fa fa-file-code-o" aria-hidden="true"></i> Fichier</a></li>
                                <li class="ligneBtnCreer" id="btnCreerDossier" data-toggle="modal" data-target="#fenetreDossier"><a><i class="fa fa-folder" aria-hidden="true"></i> Dossier</a></li>
                                <li class="ligneBtnCreer" id="btnCreerBranche" data-toggle="modal" data-target="#fenetreBranche"><a><i class="fa fa-code-fork" aria-hidden="true"></i> Branche</a></li>
                            </ul>
                        </div>
                        <span data-placement="top" data-toggle="tooltip" title="Commit les fichiers modifiés">
                            <button type="button" class="btn btn-default" id="btnCommit" data-toggle="modal" data-target="#fenetreCommit" data-placement="top"><i class="fa fa-upload" aria-hidden="true"></i></button>
                        </span>
                        <span data-placement="top" data-toggle="tooltip" title="Sauvegarder le fichier en cours">
                            <button type="button" class="btn btn-default" id="btnSave"><i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                        </span>
                        <span data-placement="top" data-toggle="tooltip" title="Compiler le projet sur la branche courante">
                            <button type="button" class="btn btn-default" id="btnCompiler"><i class="fa fa-cog" aria-hidden="true"></i></button>
                        </span>
                    </div>
                </div>
            </aside>

            <section class="row">
                    <div class="col-lg-6 col-lg-offset-1" id="editeurJava">
                        <textarea id="java-code">

                        </textarea>
                    </div>
<!--
import com.demo.util.MyType;
import com.demo.util.MyInterface;

public enum Enum {
VAL1, VAL2, VAL3
}

public class Class<T, V> implements MyInterface {
public static final MyType<T, V> member;

private class InnerClass {
public int zero() {
return 0;
}
}

@Override
public MyType method() {
return member;
}
}
-->
                    <!-- Sortie de compilation -->
                    <div class="col-lg-4" id="contenuCompilation">
                        <%--<p> Sortie du compilateur</p>--%>
                        <script type="text/javascript" src="https://asciinema.org/a/bntvk9cecmkyl95buo738zueh.js" id="asciicast-bntvk9cecmkyl95buo738zueh" data-theme="solarized-dark" data-autoplay="true" async></script>
                    </div>
            </section>
            <!-- Fin compilation -->
            <!--
            <a id="ancrePanelDroite" aria-label="Panel deroulant">
                <span class="glyphicon glyphicon-chevron-left" id="chevronAncreDroite" aria-hidden="true"></span>
            </a>

            <section id="panelDroite">
                <div id="arborescence"></div>
            </section> -->

            <a id="ancrePanelGauche" aria-label="Panel deroulant">
                <span class="glyphicon glyphicon-chevron-right" id="chevronAncreGauche" aria-hidden="true"></span>
            </a>

            <section id="panelGauche">
                    <h2> Arborescence </h2>
                    <div id="arborescenceFichier">
                    </div>
            </section>
        </main>

        <!-- Modal Commit -->
        <div id="fenetreCommit" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Ajouter un message pour votre Commit</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-group">
                            <input class="form-control" type="text" placeholder="Votre message de commit .." name="messageCommit" id="messageCommit"/>
                            <button  class="btn btn-primary" id="envoyerCommit" type="submit">Commit</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                    </div>
                </div>
                <!-- Fin Modal Content -->
            </div>
        </div>
        <!-- Modal -->
        <div id="fenetreBranche" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Créer une nouvelle branche</h4>
                    </div>
                    <div class="modal-body">
                        <form id="createBranch-modal" class="form-group">
                            <input class="form-group" type="text" placeholder="Nom de la branche" name="newBranch" id="nomBranche"/>
                            <button class="btn btn-primary" id="createBranch-button" type="submit">Créer</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                    </div>
                </div>
                <!-- Fin Modal Content -->
            </div>
        </div>
        <!-- Fin Modal Commit -->
        <div id="fenetreFichier" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Créer un nouveau fichier</h4>
                    </div>
                    <div class="modal-body">
                        <form id="createFile-modal" class="form-group">
                            <input class="form-control" type="text" placeholder="Nom du fichier" name="newFichier" id="nomFichier"/>
                            <button class="btn btn-primary" id="createFile-button" type="submit">Créer</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                    </div>
                </div>
                <!-- Fin Modal Content -->
            </div>
        </div>
        <div id="fenetreDossier" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Créer un nouveau dossier</h4>
                    </div>
                    <div class="modal-body">
                        <form id="createDossier-modal" class="form-group">
                            <input class="form-control" type="text" placeholder="nom de la branche" name="newBranch" id="nomDossier"/>
                            <button  class="btn btn-primary" id="createDossier-button" type="submit">Créer</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                    </div>
                </div>
                <!-- Fin Modal Content -->
            </div>
        </div>
        <script src="../ressources/JS/edit.js"></script>
    </body>
</html>






