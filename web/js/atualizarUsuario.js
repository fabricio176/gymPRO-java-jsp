function openModal() {
    var matricula = document.getElementById('matriculaEditar').value;
    if (matricula) {
        window.location.href = 'alterarDadosUsuarios.jsp?matricula=' + matricula;
    } else {
        alert('Por favor, insira a matrícula.');
    }
}

function closeModal() {
    document.getElementById('modal').style.display = "none";
}

function openDeleteModal() {
        var matricula = document.getElementById('matriculaDeletar').value;
        if (matricula) {
            window.location.href = 'alterarDadosUsuarios.jsp?matricula=' + matricula + '&deletar=true';
        } else {
            alert('Por favor, insira a matrícula.');
        }
    }

    function closeDeleteModal() {
        document.getElementById('deleteModal').style.display = "none";
    }
