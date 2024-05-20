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
window.addEventListener("click", function (event) {
    if (event.target == document.getElementById("modal")) {
        closeModal();
    }
});
// Seleciona os elementos do GIF e da imagem estática
var gif = document.getElementById('gif');
var staticImage = document.getElementById('static-image');
// Esconde a imagem estática inicialmente
staticImage.style.display = 'none';
// Adiciona um ouvinte de evento para quando o mouse passar sobre o GIF
gif.addEventListener('mouseenter', function () {
    // Exibe o GIF e esconde a imagem estática
    gif.style.display = 'block';
    staticImage.style.display = 'none';
});
// Adiciona um ouvinte de evento para quando o mouse sair do GIF
gif.addEventListener('mouseleave', function () {
    // Esconde o GIF e exibe a imagem estática
    gif.style.display = 'none';
    staticImage.style.display = 'block';
});

// Seleciona o elemento input
var telefoneInput = document.getElementById('telefone');

// Adiciona um ouvinte de evento de input ao input
telefoneInput.addEventListener('input', function () {
    // Remove todos os caracteres não numéricos do valor do input
    var numero = this.value.replace(/\D/g, '');

    // Formata o número de telefone adicionando os parênteses e o hífen
    var numeroFormatado = '';
    if (numero.length > 0) {
        numeroFormatado += '(' + numero.substring(0, 2) + ')';
        if (numero.length > 2) {
            numeroFormatado += ' ' + numero.substring(2, 7);
            if (numero.length > 6) {
                numeroFormatado += '-' + numero.substring(7, 11);
            }
        }
    }

    // Atualiza o valor do input com o número formatado
    this.value = numeroFormatado;
});