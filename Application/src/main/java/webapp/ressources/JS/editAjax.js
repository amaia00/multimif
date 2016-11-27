$(document).ready(function() {
    refreshPage();

    // Si on selectionne une branche
    $("#selectBranch").on("change",function(e){
        e.preventDefault();
        var idProject = $('#selectBranch option:selected').attr("project");
        var idCreator = $('#selectBranch option:selected').attr("creator");
        var branch = $('#selectBranch option:selected').text();
        var idUser = Cookies.get('idUser');
        changeBranch(idProject, idCreator, idUser, branch);
    });

    //Créer un nouvelle branche
    $("#createBranch-button").on("click", function(e){
        e.preventDefault();
        var idCreator = Cookies.get('creator');
        var idUser = Cookies.get('idUser');
        var idProject = Cookies.get('project');
        createBranch($("#nomBranche").val(), idProject, idCreator, idUser);
    });

    // Créer un fichier
    $("#createFile-button").on("click", function(e){
        e.preventDefault();
        var idCreator = Cookies.get('creator');
        var idUser = Cookies.get('idUser');
        var idProject = Cookies.get('project');
        var path = Cookies.get('path') + $("#nomFichier").val();
        var branch = Cookies.get('branch');
        createFile(idProject,idCreator, idUser,path,branch);
    });

    // Faire un commit
    $("#envoyerCommit").on("click", function(e){
        e.preventDefault();
        var idCreator = Cookies.get('creator');
        var idUser = Cookies.get('idUser');
        var idProject = Cookies.get('project');
        var branch = Cookies.get('branch');
        var message = $("#messageCommit").val();
        makeCommit(idProject,idCreator, idUser,branch,message)
    });

    $("#btnSave").on("click",function (e) {
        e.preventDefault();
        var idCreator = Cookies.get('creator');
        var idUser = Cookies.get('idUser');
        var idProject = Cookies.get('project');
        var branch = Cookies.get('branch');
        var path = Cookies.get('path');
        var content = editeur.getValue();
        edit(idProject,idUser,idCreator,branch,path,content)
    });

});

/* Actualise la page */
function refreshPage(){
    getArborescence(Cookies.get('project'),Cookies.get('creator'),Cookies.get('idUser'),Cookies.get('revision'));
    listBranch(Cookies.get('project'),Cookies.get('creator'),Cookies.get('idUser'));
}

function edit(idProject,idUser,idCreator,branch,path,content){

    var url = "/api/file/"+idUser+"/"+idCreator+"/" + idProject + "/"+branch+ "/edit?path="+path+ "&content=" + content;
    ApiRequest('POST',url,"",function(json){
        console.log("Edition: " + JSON.stringify(json));
    });
}
