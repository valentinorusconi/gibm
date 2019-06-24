var noteTemplate = undefined;
var currentNote = undefined;

function deleteNote(){
    set_call('notes/deleteNote', {id: currentNote}, function(data){
        if(data == true){
            alert('Notiz gelöscht');
            buildView();
        } else {
            alert('Notiz konnte nicht gelöscht werden.', 'danger');
            buildView();
        }
    });
}

function addNote(){
    var noteTitle = $('#newNoteTitle').val();
    set_call('notes/addNote', {title: noteTitle}, function(data){
        if(data == true){
            alert('Notiz erstellt');
            buildView();
        } else {
            alert('Notiz konnte nicht erstellt werden. Überprüfen Sie Ihre Eingaben.', 'danger');
        }
    });
}

function deleteShare(email){
    set_call('notes/deleteShare', {id: currentNote, email: email}, function(data){
        if(data == true){
            alert('Freigabe gelöscht');
            buildView();
        } else {
            alert('Freigabe konnte nicht gelöscht werden.', 'danger');
        }
    });
}

function addShare(){
    var email = $('#newShareMail').val();
    set_call('notes/addShare', {id: currentNote, email: email}, function(data){
        if(data == true){
            alert('Freigabe erstellt');
            buildView(currentNote);
        } else {
            alert('Freigabe konnte nicht erstellt werden. Überprüfen Sie die E-Mail', 'danger');
        }
    });
}

function saveChanges(object){
    var changes = $('#editedContent').val();
    var newdate = $('#editedDate').val();
    set_call('notes/saveChanges', {id: currentNote, content: changes, date:newdate}, function(data){
        if(data == true){
            $('#editorModal').modal('hide');
            alert('Änderungen gespeichert');
            openNote(currentNote);
        } else {
            alert('Änderungen konnten nicht gespeichert werden.', 'danger');
        }
    });
}

function openNote(noteID){
    $('.modal-backdrop').each(function(){$(this).remove();});
    get_call('singleNote', {id: noteID}, function(data){

        if(document.getElementById("singleNote")){
            $('#singleNote').remove();
        }

        data['content'] = parseSpecial(data['content']);
        data['dateDisplay'] = formatDate(data['date'], 2);

        data['deadline'] = formatDate(data['deadline'], 2);
        if(data['deadline'].startsWith("NaN")){
            data['deadline'] = 'Noch nicht definiert.';
        } else {
            data['date'] = formatDate(data['deadline'], 1);
        }

        currentNote = noteID;

        content.append(Mustache.to_html(noteTemplate, data));

    });
}

function buildView(){
    $('.modal-backdrop').each(function(){$(this).remove();});
    content.html('');
    get_call('userNotes', {}, function(data){
        var userNotes = {notes: data};
        $.get('templates/notesNav.html', function(data){
            if(document.getElementById("notesNav")){
                $('#notesNav').remove();
            }
            for(var i=0; i<userNotes['notes'].length;i++){
                userNotes['notes'][i]['title'] = parseSpecial(userNotes['notes'][i]['title']);
            }
            content.append(Mustache.to_html(data, userNotes));
        });

    });
}

$.get('templates/singleNote.html', function(data){
    noteTemplate = data;
});

buildView();
