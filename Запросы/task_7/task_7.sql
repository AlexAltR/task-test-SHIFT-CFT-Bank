CREATE OR REPLACE PROCEDURE Normalization_procedure() LANGUAGE plpgsql AS $$
DECLARE
--переменные
genre_rec RECORD; 
counter integer; --счетчик
summ integer; --сумма
begin
	summ := 0;
	counter := 1;
	for genre_rec in (SELECT * FROM "public"."RECORDS" order by "ID")
		LOOP
			--RAISE NOTICE 'Genre Id is : % , Sum is : %, ACC_REF : %, genre_rec : %', genre_rec."ID",genre_rec."SUM", genre_rec."ACC_REF", genre_rec;
				if(genre_rec."ACC_REF" = counter)
				then 
					if(genre_rec."DT" = 0)
					then
						summ := summ + genre_rec."SUM";
					end if;
					if(genre_rec."DT" = 1)
					then
						summ := summ - genre_rec."SUM";
					end if;
				end if;
				if(genre_rec."ACC_REF" != counter AND genre_rec."DT" = 0)
				then
					--update ACCOUNTS
					update "public"."ACCOUNTS"
					set "SALDO" = summ
					where "ACCOUNTS"."ID" = counter;
					counter := counter + 1;
					summ := 0 + genre_rec."SUM";
				end if;
				if(genre_rec."ACC_REF" != counter AND genre_rec."DT" = 1)
				then
					--update ACCOUNTS
					update "public"."ACCOUNTS"
					set "SALDO" = summ
					where "ACCOUNTS"."ID" = counter;
					counter := counter + 1;
					summ := 0 - genre_rec."SUM";
				end if;
				
			--update ACCOUNTS
			update "public"."ACCOUNTS"
			set "SALDO" = summ
			where "ACCOUNTS"."ID" = counter;
			
			--RAISE NOTICE 'Summ : %',summ;
			
		END LOOP;

end;$$


call Normalization_procedure();