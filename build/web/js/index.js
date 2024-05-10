/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

 function openModal() {
        document.getElementById("modal").style.display = "flex";
    }

    // Função para fechar a janela modal
    function closeModal() {
        document.getElementById("modal").style.display = "none";
    }

    // Event listener para abrir a janela modal quando o botão for clicado
    document.getElementById("openModalBtn").addEventListener("click", openModal);

    // Event listener para fechar a janela modal quando clicar no overlay ou pressionar 'Esc'
    window.addEventListener("click", function(event) {
        if (event.target == document.getElementById("modal")) {
            closeModal();
        }
    });

    window.addEventListener("keydown", function(event) {
        if (event.key === "Escape") {
            closeModal();
        }
    });