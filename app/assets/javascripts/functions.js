$(document).ready(function() {
	// CIDADE POR ESTADO
	$("#estado_id").change(function() {
		$("#bairro_id").empty();
		$("#cidade_id").empty();

		$("<option value=''>Selecione</option>").appendTo("#cidade_id");
		$("<option value=''>Selecione</option>").appendTo("#bairro_id");

		$.getJSON("/combo/cidades/" + $(this).val(), function(data) {
			$.each(data, function(i,item) {
				$("<option value=\"" + item.id + "\">" + item.nome + "</option>").appendTo("#cidade_id");
			});
		})
	});

	// CIDADE POR ESTADO COM LOJA
	$("#estado_id_com_loja").change(function() {
		$("#bairro_id").empty();
		$("#cidade_id_com_loja").empty();

		$("<option value=''>Selecione</option>").appendTo("#cidade_id_com_loja");
		$("<option value=''>Selecione</option>").appendTo("#bairro_id");

		$.getJSON("/combo/cidades/com_loja/" + $(this).val(), function(data) {
			$.each(data, function(i,item) {
				$("<option value=\"" + item.id + "\">" + item.nome + "</option>").appendTo("#cidade_id_com_loja");
			});
		})
	});

	// BAIRRO POR CIDADE
	$("#cidade_id").change(function() {
		$("#bairro_id").empty();
		$("<option value=''>Selecione</option>").appendTo("#bairro_id");

		$.getJSON("/combo/bairros/" + $(this).val(), function(data) {
			$.each(data, function(i,item) {
				$("<option value=\"" + item.id + "\">" + item.nome + "</option>").appendTo("#bairro_id");
			});
		})
	});

	// BAIRRO POR CIDADE COM LOJA
	$("#cidade_id_com_loja").change(function() {
		$("#bairro_id").empty();
		$("<option value=''>Selecione</option>").appendTo("#bairro_id");

		$.getJSON("/combo/bairros/com_loja/" + $(this).val(), function(data) {
			$.each(data, function(i,item) {
				$("<option value=\"" + item.id + "\">" + item.nome + "</option>").appendTo("#bairro_id");
			});
		})
	});
});

// CARREGA DADOS DO TEMPLO (ENDEREÇO, BAIRRO, CIDADE, UF, CEP)
function carregarDadosTemplo(templo_id) {
	if (templo_id == "" || templo_id == undefined) {
		$("#loja_endereco").val("");
		$("#estado_id").val("");

		$("#cidade_id").empty();
		$("#cidade_id").append('<option value="">Selecione</option>');

		$("#bairro_id").empty();
		$("#bairro_id").append('<option value="">Selecione</option>');

		$("#loja_cep").val("");
	} else {
		jQuery.ajax({
			type: "GET",
			url: "/loja/carregar_dados_templo/" + templo_id
		});
	}
}

// CARREGA ENDEREÇO DA LOJA (ENDEREÇO, BAIRRO, CIDADE, UF, CEP)
function carregarDadosEndereco(loja_id) {
	jQuery.ajax({
		type: "GET",
		url: "/loja/carregar_dados_endereco/" + loja_id
	});
}

// CARREGA OS DADOS DA LOJA
function carregarDadosLoja(loja_id) {
	if (loja_id == 0 || loja_id == undefined) {
		return false;
	} else {
		if (loja_id != "" || loja_id != undefined) {
			window.location.href = "/selecionar_loja/" + loja_id
		}
	}
}

// VERIFICA SE A PESSOA JÁ ESTÁ CADASTRADA EM OUTRA LOJA
function CPFCadastradoEmOutraloja(cpf, cim, loja_id) {
	if (cpf == "" && cim == "") {
		alert("Informe o CPF ou CIM");
	}

	if (cpf != "" && cpf != undefined) { // CPF
		cpf = cpf.replace(/\./g, "").replace(/\-/g, "");

		if (validarCPF(cpf)) {
			jQuery.ajax({
				type: "GET",
				url: "/verificar_pessoa/" + cpf + "/em/" + loja_id + "?opcao=cpf",
				success: function(data) {
					if (data.ja_cadastrado_na_mesma_loja == true) {
						alert("Este irmão já está cadastrado nesta loja.");
					} else if (data.ja_cadastrado_em_outra_loja == true) {
						dialog("cpf", data.cpf, data.nome_irmao);
					} else {
						$("#botao_cadastrar").show();
						$("#complemento_form_pessoa").slideDown();
					}
				}
			});
		} else {
			alert("CPF Inválido")
		}
	} else if (cim != "" && cim != undefined) { // CIM
		jQuery.ajax({
			type: "GET",
			url: "/verificar_pessoa/" + cim + "/em/" + loja_id + "?opcao=cim",
			success: function(data) {
				if (data.ja_cadastrado_na_mesma_loja == true) {
					alert("Este irmão já está cadastrado nesta loja.");
				} else if (data.ja_cadastrado_em_outra_loja == true) {
					dialog("cim", data.cim, data.nome_irmao);
				} else {
					$("#botao_cadastrar").show();
					$("#complemento_form_pessoa").slideDown();
				}
			}
		});
	}
}

// EXIBE MENSAGEM PERGUNTANDO SE DESEJA FILIAR O IRMÃO À LOJA CORRENTE
function dialog(opcao, identificador, nome_irmao) {
	var pergunta = confirm("O irmão " + nome_irmao + " já está cadastrado em outra loja. Deseja associar o irmão à loja atual ?")

	var loja_id = $("#loja_id").val();

	if (pergunta == true) {
		window.location.href = "/irmaos/"+ identificador + "/filiar/" + loja_id + "?opcao=" + opcao
	}
}


// DESFILIA O IRMÃO DA LOJA
function desfiliar(opcao, identificador, loja_id) {
	var pergunta = confirm("Deseja realmente desfiliar o irmão ?")

	if (pergunta == true) {
		window.location.href = "/irmaos/"+ identificador + "/desfiliar/" + loja_id + "?opcao=" + opcao
	}
}

function validarCPFSubmit(cpf) {
	console.log(cpf);

	if (cpf != "" && cpf != undefined) {
		if (!validarCPF(cpf)) {
			alert("CPF Inválido");
			return false;
		} else {
			return true;
		}
	}
}

function validarCPF(cpf) {
	cpf = cpf.replace(/[^\d]+/g,'');

	if(cpf == '') return false;

	// Elimina CPFs invalidos conhecidos
	if (cpf.length != 11 ||  cpf == "00000000000" ||  cpf == "11111111111" ||  cpf == "22222222222" ||  cpf == "33333333333" ||  cpf == "44444444444" ||  cpf == "55555555555" ||  cpf == "66666666666" ||  cpf == "77777777777" ||  cpf == "88888888888" ||  cpf == "99999999999")
		return false;
     
    // Valida 1o digito
    add = 0;

    for (i=0; i < 9; i ++)
        add += parseInt(cpf.charAt(i)) * (10 - i);

    rev = 11 - (add % 11);

		if (rev == 10 || rev == 11)
        rev = 0;

    if (rev != parseInt(cpf.charAt(9)))
        return false;
     
    // Valida 2o digito
    add = 0;

    for (i = 0; i < 10; i ++)
        add += parseInt(cpf.charAt(i)) * (11 - i);

    rev = 11 - (add % 11);

    if (rev == 10 || rev == 11)
        rev = 0;
    if (rev != parseInt(cpf.charAt(10)))
        return false;
         
    return true;    
}

function desmarcarVisibilidades() {
	if ($("#visibilidade_checkboxes #checkbox-4").is(":checked")) {
		$("#visibilidade_checkboxes #checkbox-1").attr("checked", false);
		$("#visibilidade_checkboxes #checkbox-2").attr("checked", false);
		$("#visibilidade_checkboxes #checkbox-3").attr("checked", false);
	}
}

function exibirDadosMaconicos(grau) {
	if (grau == "") {
		$("#elevacao_em").hide();
		$("#exaltacao_em").hide();
		$("#instalacao_em").hide();

		$("#pessoa_elevacao_em").val("");
		$("#pessoa_exaltacao_em").val("");
		$("#pessoa_instalacao_em").val("");
	}

	// Aprendiz
	if (grau == 1) {
		$("#elevacao_em").hide();
		$("#instalacao_em").hide();
		$("#exaltacao_em").hide();

		$("#pessoa_elevacao_em").val("");
		$("#pessoa_instalacao_em").val("");
		$("#pessoa_exaltacao_em").val("");

		$("#iniciacao_em").show();
	} // Companheiro
	if (grau == 2) {
		$("#exaltacao_em").hide();
		$("#instalacao_em").hide();

		$("#pessoa_instalacao_em").val("");
		$("#pessoa_exaltacao_em").val("");

		$("#elevacao_em").show();

	// Mestre
	} else if (grau == 3) {
		$("#instalacao_em").hide();

		$("#pessoa_instalacao_em").val("");

		$("#elevacao_em").show();
		$("#exaltacao_em").show();

	// Mestre instalado
	}	else if (grau == 4) {
		$("#elevacao_em").show();
		$("#exaltacao_em").show();
		$("#instalacao_em").show();
	}
}