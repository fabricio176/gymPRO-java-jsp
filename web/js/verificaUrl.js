/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


// Função para exibir pop-up de sucesso
function showSuccessMessage() {
    alert("Usuário atualizado com sucesso!");
    window.location.href = window.location.pathname; // Atualiza a página
}

// Verifica a URL para a mensagem de sucesso após o carregamento completo da página
window.onload = function() {
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has('success')) {
        showSuccessMessage();
    }
};