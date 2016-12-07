<%--
  Created by IntelliJ IDEA.
  User: thibom
  Date: 17/10/16
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Projet MULTIMIF - Home</title>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.1.3/js.cookie.js"></script>
        <script src="https://mbraak.github.io/jqTree/tree.jquery.js"></script>
        <link rel="stylesheet" href="https://mbraak.github.io/jqTree/jqtree.css" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css" type="text/css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>


        <!-- Diff 2 html -->
        <script src="../diff2html/dist/diff2html.js"></script>
        <link rel="stylesheet" href="../diff2html/dist/diff2html.css">

        <!-- Script perso -->
        <script src="../ressources/JS/api.js"></script>
        <script src="../ressources/JS/git.js"></script>


        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../ressources/CSS/home.css">
        <!--[if lt IE 9]>
        <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <link href="../ressources/img/favicon.png" rel="icon" type="image/x-icon" />
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
                            <li class="active"><a href="home.jsp">Home</a></li>
                            <li><a href="edit.jsp">Edition</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a id="deconnexion" href="#">Deconnexion</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <main class="">
            <div class="col-lg-4 col-md-12" id="homeGauche">
                <section class="col-lg-12" id="divProjets">
                    <header class="page-header">
                        <h2 class="h2DivProjet"><i class="fa fa-user" aria-hidden="true"></i> Mes Projets
                        <button data-toggle="modal" data-target="#creerProjet" class="btn btn-primary btn-sm" id="ajouterProjet">Projet <i class="fa fa-plus-square" aria-hidden="true"></i></button>
                        <button data-toggle="modal" data-target="#clonerModalProjet" class="btn btn-primary btn-sm" id="clonerProjet">Projet Github <i class="fa fa-github" aria-hidden="true"></i></button>
                        </h2>
                    </header>
                    <div class="col-lg-12" id="listeProjets">
                        <div class="btn-group col-lg-12 ligneListeProjet">
                            <button type="button" class="btn btn-default nomListeProjets">Projet 1</button>
                            <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-remove spanSupprimerProjet"></span></button>
                        </div>
                    </div>
                </section>
                <section class="col-lg-12" id="divCollaboration">
                    <header class="page-header">
                        <h2 id="h2DivCollaboration"><i class="fa fa-users" aria-hidden="true"></i> Mes Collaborations </h2>
                    </header>
                    <div class="btn-group col-lg-12" id="listeCollaborations">
                        <div class="btn-group col-lg-12 ligneListeCollaborations">
                            <button type="button" class="btn btn-default nomListeCollaborations">Collaboration 1</button>
                            <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-remove spanSupprimerProjet"></span></button>
                        </div>
                    </div>
                </section>
            </div>
            <!-- <section class="col-lg-7 col-md-12 hide" id="homeDroite"> -->
            <section class="col-lg-8 col-md-12" id="homeDroite">
                <header class="col-lg-12 page-header">
                    <h2 id="projectName" class="h2DivProjet"> Nom du Projet</h2>
                    <button data-toggle="modal" data-target="#ajoutCollaborateur" class="btn btn-primary btn-sm" id="btnAjouterCollaborateur">Collaborateur <i class="fa fa-user-plus" aria-hidden="true"></i></button>
                </header>
                <div class="col-lg-12 col-md-12 info-project">
                    <ul class="list-inline">
                        <li><span class="label label-default">Date de création</span><span class="label label-success" id="project-creation-date">12/12/4512</span></li>
                        <li><span class="label label-default">Dernière modification</span><span class="label label-success" id="project-last-modfif">12/12/4512</span></li>
                        <li><span class="label label-default">Type</span><span class="label label-success" id="project-type">12/12/4512</span></li>
                    </ul>
                </div>

                <div class="col-lg-12" id="divDiff"></div>

                <div class="col-lg-9" id="divCommit">
                    <div class="col-lg-12" id="divSelectCommit">
                        <form class="form-inline ">
                        <div class="form-group col-lg-12">
                            <label for="selectBranch"><i class="fa fa-code-fork" aria-hidden="true"></i> Branche: </label>
                            <select class="form-group form-control input-large" id="selectBranch">
                                <option></option>
                            </select>
                            <button type="button" class="btn btn-info" id="getArchive">Archive <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span></button>
                        </div>
                        </form>

                    </div>
                    <div class="col-lg-12" id="divAfficherCommit">
                        <ul class="list-group" id="listCommit">
                            <!-- <li class="list-group-item ligneCommit" creator="1" project="1" revision="02679c341374fca83a6331a11e43390da09ac39f" branch="master">
                                <h5><strong>Révision:</strong> <span class="label label-default">02679c341374fca83a6331a11e43390da09ac39f</span> -
                                    <span class="label label-info">Commit le 02/09/1995</span>
                                </h5>
                                <p><strong> Message:</strong> bonjour</p>


                                <!-- <span> Utilisateur: Alexis</span>
                                <span> Email: Alexis@Granola</span> -->
                                <!-- <button type="button" id="diffButton" class="btn btn-primary btn-sm" creator="1" project="1" revision="02679c341374fca83a6331a11e43390da09ac39f" branch="master">DIFF</button>
                            </li>-->
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3" id="divListeDeveloppeur">
                    <header>
                        <h4><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Dev du projets </h4>
                    </header>
                    <div>
                        <ul class="list-group" id="listDev">
                            <li class="list-group-item">Nom 1</li>
                        </ul>
                    </div>
                </div>
            </section>
            <!--
            <a id="ancrePanel" aria-label="Panel deroulant"><span class="glyphicon glyphicon-chevron-left" id="chevronAncre" aria-hidden="true"></span></a>
            <section id="panelDeroulant">
                <p> BLABLABLA </p>
                <p> BLABLABLA </p>
            </section> -->
        </main>

        <!-- Modal Creation de projet -->
        <div id="creerProjet" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Parametre du projet </h4>
                    </div>
                    <div class="modal-body">
                        <form id="formProjet">
                            <label class="labelProjet"> Nom du projet </label>
                            <input type="text" placeholder="Nom du projet" name="name" id="nomProjet" required />
                            <label class="labelProjet"> Langage </label>
                            <select name="type" class="form-group form-control" id="selectProjet">
                                <option value="MAVEN"> MAVEN </option>
                                <option value="CMAKE"> CMAKE </option>
                            </select>
                            <input  class="btn btn-success" id="btnProjet" type="submit" value="Créer" />
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                    </div>
                </div>
                <!-- Fin Modal Content -->

            </div>
        </div>
        <div id="clonerModalProjet" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Parametre du projet GIT </h4>
                    </div>
                    <div class="modal-body">
                        <form id="formCloneProjet">
                            <label class="labelProjet"> url du projet GIT </label>
                            <input type="text" placeholder="url du projet" name="name" id="urlCloneProjet" required />
                            <label class="labelProjet"> Langage </label>
                            <select name="type" class="form-group form-control" id="selectCloneProjet">
                                <option value="MAVEN">MAVEN</option>
                                <option value="CMAKE">CMAKE</option>
                            </select>
                            <input  class="btn btn-success" id="btnCloneProjet" type="submit" value="Cloner" />
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                    </div>
                </div>
                <!-- Fin Modal Content -->

            </div>
        </div>
        <!-- Fin Modal Creation de Projet -->

        <!-- Modal Ajout de Collaborateur -->
        <div id="ajoutCollaborateur" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Ajouter un Collaborateur </h4>
                    </div>
                    <div class="modal-body">
                        <formid="formAjoutCollaborateur">
                            <select id="select-collaborateur"></select>
                            <input  class="btn btn-success" id="btnAjoutCollaborateur" type="submit" value="Ajouter" />
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                    </div>
                </div>
                <!-- Fin Modal Content -->

            </div>
        </div>
        <!-- Fin Modal Ajout de Collaborateur -->

        <script src="../ressources/JS/home.js"></script>
    </body>
</html>
