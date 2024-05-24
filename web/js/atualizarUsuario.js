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

 function openSettings() {
        document.getElementById("settingsModal").style.display = "block";
    }

    // Função para fechar a janela modal de configurações
    function closeSettings() {
        document.getElementById("settingsModal").style.display = "none";
    }
    
    document.getElementById('addUser').style.display = 'block';

        // Função para mostrar a div correspondente e ocultar as outras
        function mostrarDiv(idDiv) {
            // Oculta todas as divs
            var divs = document.getElementsByClassName('div-menu');
            for (var i = 0; i < divs.length; i++) {
                divs[i].style.display = 'none';
            }
            // Mostra a div correspondente ao idDiv
            document.getElementById(idDiv).style.display = 'block';
        }