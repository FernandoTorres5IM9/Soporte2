
            function ValidarLN()
            {
                
                var letras=" ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyzÁÉÍÓÚáéíóú";
                var tecla=event.keyCode;
                var char=String.fromCharCode(tecla);
                var valid=letras.indexOf(char);
                
                
                if(valid===-1)
                {
                    event.returnValue=false;
                }
               
            }
            function ValidarNum2()
            {
                var num= "1234567890";
                var tecla= event.keyCode;
                var char= String.fromCharCode(tecla);
                var valid= num.indexOf(char);
                
                if(valid===-1)
                {
                    event.returnValue=false;
                }
            }


function click(){
	if(event.button==2)
		{
			alert('Accion invalida!');
		}
}
document.onmousedown = click

function disableCopyPaste(elm) 
	{
		// Deshabilitar los eventos cut/copy/paste
		elm.onkeydown = interceptKeys
		elm.oncontextmenu = function() {
			return false
		}
	}

function interceptKeys(evt) {
    evt = evt||window.event // IE support
    var c = evt.keyCode
    var ctrlDown = evt.ctrlKey||evt.metaKey // Mac
    if (ctrlDown && evt.altKey) return true
    // Verifica los ctrl + c, v y x
    else if (ctrlDown && c==67) return false // c
    else if (ctrlDown && c==86) return false // v
    else if (ctrlDown && c==88) return false // x

    return true
}

