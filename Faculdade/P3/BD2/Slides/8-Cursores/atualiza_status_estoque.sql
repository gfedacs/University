Do $$
Declare
	qtd_atual produto.quantidade%type;
	v_cod produto.numped%type;
	p_cursor_prod cursor for select codprod,quantidade from produto;
Begin
	open p_cursor_prod;
	loop
		fetch p_cursor_prod into v_cod,qtd_atual;
		if qtd_atual > 30 then
			update produto
			set status = 'Estoque dentro do esperado'	
			where codprod = v_cod;
		else update produto
			 set status = 'Estoque fora do limite mínimo'
			 where codprod = v_cod;
		end if;
		exit when not found;
	end loop;
	close p_cursor_prod;
End$$