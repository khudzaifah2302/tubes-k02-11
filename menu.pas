program tubes;

uses sysutils;

type
	nilaiTukar = record
		nilaiKursAsal : real;
		kursAsal : string;
		nilaiKursTujuan : real;
		kursTujuan : string;
	end;
	pembelian = record
		nomorAkun : string;
		jenisBarang : string;
		penyedia : string;
		nomorTujuan : string;
		mataUang : string;
		jumlah : real;
		saldo : real;
		tanggalTransaksi : string; 
	end;
	pembayaran = record
		nomorAkun : string;
		jenisTransaksi : string;
		rekeningBayar : string;
		mataUang :string;
		jumlah : real;
		saldo : real;
		tanggalTransaksi : string;
	end;
	transfer = record
		nomorAkunAsal : string;
		nomorAkuntujuan : string;
		jenisTransfer : string;
		namaBankLuar : string;
		mataUang : string;
		jumlah : real;  
		saldo : real;  
		tanggalTransaksi : string ;  
	end;
	setoran = record
		nomorAkun : string;
		jenisTransaksi : string;
		mataUang : string;
		jumlah : real;
		saldo : real; 
		tanggalTransaksi : string;
	end;
	rekening = record
		nomorAkun : string;
		nomorNasabah : string;
		jenisrekening : string;
		mataUang : string;
		saldo : real;
		setoranRutin : real;
		rekeningAutodebet : string;
		jangkaWaktu : string; 
		tanggalMulai : string; 
	end;
	nasabah = record
		nomorNasabah : string;
		namaNasabah : string;
		alamat : string;
		kota : string;
		email : string;
		nomorTelp : string;
		username : string;
		password : string;
		status : string;
	end;
	listNasabah = record
		nasabah : array [1..100] of nasabah;
		neff : integer;
	end;
	listRekening = record
		rekening : array [1..200] of rekening;
		neff : integer;
	end;
	listSetoran = record
		setoran : array [1..400] of setoran;
		neff : integer;
	end;
	listTransfer = record
		transfer : array [1..400] of transfer;
		neff : integer;
	end;
	listPembayaran = record
		pembayaran : array [1..400] of pembayaran;
		neff : integer;
	end;
	listPembelian = record
		pembelian : array [1..400] of pembelian;
		neff : integer;
	end;
	listNilaiTukar = record
		nilaiTukar : array [1..400] of nilaiTukar;
		neff : integer;
	end;
	
var
	fNasabah 	: file of  nasabah;
	varNasabah 	: nasabah;
	fRekening 	: file of  rekening;
	varRekening 	: rekening;
	fSetoran 	: file of setoran;
	varSetoran 	: setoran;
	fTranfer 	: file of transfer;
	varTransfer 	: transfer;
	fPembayaran 	: file of pembayaran;
	varPembayaran 	: pembayaran;
	fPembelian 	: file of pembelian;
	varPembelian 	: pembelian;
	fNilaiTukar 	: file of nilaiTukar;
	varNilaiTukar 	: nilaiTukar;
	lNasabah 	: listNasabah;
	lRekening 	: listRekening;
	lSetoran 	: listSetoran;
	lTransfer 	: listTransfer;
	lPembayaran 	: listPembayaran;
	lPembelian 	: listPembelian;
	lNilaiTukar 	: listNilaiTukar;
	noNasabah	: string;
	urutanNasabah 	: integer;
	chs		: integer;

function jatuhtempo(R : Rekening):Boolean;
{Mencari tahu apakah akun sudah jatuh tempo atau belum}

begin
	jatuhtempo := false;
		if (R.jangkaWaktu = '1 bulan') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>30) then jatuhtempo:=True;
			end else
		if (R.jangkaWaktu = '3 bulan') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>90) then jatuhtempo:=True;
			end else
		if (R.jangkaWaktu = '6 bulan') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>180) then jatuhtempo:=True;
			end else
		if (R.jangkaWaktu = '12 bulan') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>365) then jatuhtempo:=True;
			end else
		if (R.jangkaWaktu = '1 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>365) then jatuhtempo:=True;
			end else
		if (R.jangkaWaktu = '2 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>730) then jatuhtempo:=True;
			end else
		if (R.jangkaWaktu = '3 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>1095) then jatuhtempo:=True;
			end else
		if (R.jangkaWaktu = '4 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>1460) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '5 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>1875) then jatuhtempo:=True;
			end else
		if (R.jangkaWaktu = '6 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>2190) then jatuhtempo:=True;
			end else
		if (R.jangkaWaktu = '7 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>2555) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '8 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>2920) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '9 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>3285) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '10 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>3650) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '11 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>4015) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '12 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>4380) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '13 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>4745) then jatuhtempo:=True;
			end else			
		if (R.jangkaWaktu = '14 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>5110) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '15 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>5475) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '16 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>5840) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '17 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>6205) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '18 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>6570) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '19 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>6935) then jatuhtempo:=True;
			end else		
		if (R.jangkaWaktu = '20 tahun') then
			begin
				if (Date-StrToDate(R.tanggalMulai)>7300) then jatuhtempo:=True;
			end else		
end;

function findrekening (T2:listRekening; x:integer):boolean;
var
	temp 	:string;
	i		:integer;
	found 	:boolean;
begin
	if (x=1) then begin
		temp:='deposito'; i:=1;found := false;
		while (i<= T2.neff) and (not(found)) do begin
			if (temp = T2.rekening[i].jenisrekening) then 
				found:= true
			else i:= i+1;
		end;
		findrekening := found;
	end;
	if (x=2) then begin
		temp:='tabungan rencana'; i:=1;found := false;
		while (i<= T2.neff) and (not(found)) do begin
			if (temp = T2.rekening[i].jenisrekening) then 
				found:= true
			else i:= i+1;
		end;
		findrekening := found;
	end;
	if (x=3) then begin
		temp:='tabungan mandiri'; i:=1;found := false;
		while (i<= T2.neff) and (not(found)) do begin
			if (temp = T2.rekening[i].jenisrekening) then 
				found:= true
			else i:= i+1;
		end;
		findrekening := found;	
	end;
end;				

procedure InformasiSaldo (T2:listRekening);
var
	i	:integer;
	x	:integer;
begin
	writeln ('Pilih jenis rekening :');
	writeln ('1. Deposito');
	writeln ('2. Tabungan Rencana');
	writeln ('3. Tabungan Mandiri');
	write ('Jenis rekening: '); 
	readln (x);
	while (x<1) or (x>3) do begin
		writeln ('Masukan angka 1, 2, atau 3');
		write ('Jenis rekening: ');
		readln (x);
	end;
	findrekening (T2,x);
	if (findrekening (T2,x)) then begin
		if (x = 1) then begin
			writeln ('Pilih Rekening Deposito anda ');
			for i:= 1 to T2.neff do begin
				writeln (i,'. ',T2.rekening[i].nomorAkun);
			end;
			write ('Pilih Rekening Deposito: '); readln(i);
			writeln ('Nomor Rekening: ', T2.rekening[i].nomorAkun);
			writeln ('Tanggal Mulai: ',T2.rekening[i].tanggalMulai);
			writeln ('Mata Uang: ',T2.rekening[i].mataUang);
			writeln ('Jangka Waktu: ',T2.rekening[i].jangkaWaktu);
			writeln ('Setoran Rutin: ',T2.rekening[i].setoranRutin);
			writeln ('Saldo: ',T2.rekening[i].saldo);
		end;
		if (x = 2) then begin
			writeln ('Pilih Rekening Tabungan Rencana anda ');
			for i:= 1 to T2.neff do begin
				writeln (i,'. ',T2.rekening[i].nomorAkun);
			end;
			write ('Pilih Rekening Tabungan Rencana: '); readln(i);
			writeln ('Nomor Rekening: ', T2.rekening[i].nomorAkun);
			writeln ('Tanggal Mulai: ',T2.rekening[i].tanggalMulai);
			writeln ('Mata Uang: ',T2.rekening[i].mataUang);
			writeln ('Jangka Waktu: ',T2.rekening[i].jangkaWaktu);
			writeln ('Setoran Rutin: ',T2.rekening[i].setoranRutin);
			writeln ('Saldo: ',T2.rekening[i].saldo);
		end;
		if (x = 3) then begin
			writeln ('Pilih Rekening Tabungan Mandiri anda ');
			for i:= 1 to T2.neff do begin
				writeln (i,'. ',T2.rekening[i].nomorAkun);
			end;
			write ('Pilih Rekening Tabungan Mandiri: '); readln(i);
			writeln ('Nomor Rekening: ', T2.rekening[i].nomorAkun);
			writeln ('Tanggal Mulai: ',T2.rekening[i].tanggalMulai);
			writeln ('Mata Uang: ',T2.rekening[i].mataUang);
			writeln ('Jangka Waktu: ',T2.rekening[i].jangkaWaktu);
			writeln ('Setoran Rutin: ',T2.rekening[i].setoranRutin);
			writeln ('Saldo: ',T2.rekening[i].saldo);
		end;
	end else begin	
		if (x=1) then begin
			writeln ('Anda tidak mempunyai rekening deposito') ;
		end;
		if (x=2) then begin
			writeln ('Anda tidak mempunyai rekening tabungan rencana') ;
		end;
		if (x=3) then begin
			writeln ('Anda tidak mempunyai rekening tabungan mandiri') ;
		end;
	end;
end;

procedure tulisMenu;
begin
	writeln('> Menu:');
	writeln;
	writeln('> 1. Lihat Rekening ');
	writeln('> 2. Informasi Saldo ');
	writeln('> 3. Lihat Aktivitas Transaksi ');
	writeln('> 4. Pembuatan Rekening Baru');
	writeln('> 5. Setoran ');
	writeln('> 6. Penarikan ');
	writeln('> 7. Transfer ');
	writeln('> 8. Pembayaran ');
	writeln('> 9. Pembelian ');
	writeln('> 10. Penutupan Rekening ');
	writeln('> 11. Perubahan Data Nasabah ');
	writeln('> 12. Penambahan/perubahan rekening AutoDebet ');
	writeln('> 13. exit ');
end;
	
procedure load(var ln : listNasabah; lr : listRekening; ls : listSetoran; lt : listTransfer; lbyr : listPembayaran; lbeli : listPembelian; lnt : listNilaiTukar);
var
	fn : file of nasabah;
	fr : file of rekening;
	fs : file of setoran;
	ft : file of transfer;
	fbyr : file of pembayaran;
	fbeli : file of pembelian;
	fnt : file of nilaiTukar;
	namaFile : string;
	n : nasabah;
	r :rekening;
	s : setoran;
	t : transfer;
	byr : pembayaran;
	beli : pembelian;
	nt : nilaiTukar;
	i : integer;
	loop : boolean;
	a : integer;
	
begin
	loop := true;
	while loop do
	begin
		writeln('> 1. Nasabah');
		writeln('> 2. Rekening');
		writeln('> 3. Setoran');
		writeln('> 4. Transfer');
		writeln('> 5. Pembayaran');
		writeln('> 6. Pembelian');
		writeln('> 7. Nilai tukar');
		writeln('> 8. Exit load');
		write('> masukkan angka untuk menge-load file sesuai jenis:');
		readln(a);
		case a of
			1 :
				begin
					i :=1;
					writeln('> File nasabah');
					writeln('> load');
					write('> nama file : ');
					readln(namaFile);
					assign(fn,namaFile);
					reset(fn);
					ln.neff := 0;
					while (not eof(fn)) and (i>=201) do
					begin
						read(fn,n);
						ln.nasabah[i] := n;
						i:=i+1;
						ln.neff := ln.neff +1;
					end;
					writeln('> pembacaan file selesai');
				end;
			2 :
				begin
					lr.neff := 0;
					i :=1;
					writeln('> File rekening');
					writeln('> load');
					write('> nama file : ');
					readln(namaFile);
					assign(fr,namaFile);
					reset(fr);
					while (not eof(fr)) and (i>=201) do
					begin
						read(fr,r);
						lr.rekening[i] := r;
						i:=i+1;
						lr.neff := lr.neff+1;
					end;
					writeln('> pembacaan file selesai');
				end;
			3 :
				begin
					i :=1;
					writeln('> File setoran');
					writeln('> load');
					write('> nama file : ');
					readln(namaFile);
					assign(fs,namaFile);
					ls.neff := 0;
					reset(fs);
					while (not eof(fs)) and (i>=401) do
					begin
						read(fs,s);
						ls.setoran[i] := s;
						i:=i+1;
						ls.neff:=ls.neff+1;
					end;
					writeln('> pembacaan file selesai');
				end;
			4 :
				begin
					i :=1;
					writeln('> File transfer');
					writeln('> load');
					write('> nama file : ');
					readln(namaFile);
					assign(ft,namaFile);
					lt.neff := 0;
					reset(ft);
					while (not eof(ft)) and (i>=401) do
					begin
						read(ft,t);
						lt.transfer[i] := t;
						i:=i+1;
						lt.neff := lt.neff+1;
					end;
					writeln('> pembacaan file selesai');
				end;
			5 :
				begin
					i :=1;
					writeln('> File pembayaran');
					writeln('> load');
					write('> nama file : ');
					readln(namaFile);
					assign(fbyr,namaFile);
					lbyr.neff := 0;
					reset(fbyr);
					while (not eof(fbyr)) and (i>=401) do
					begin
						read(fbyr,byr);
						lbyr.pembayaran[i] := byr;
						lbyr.neff := lbyr.neff+1;
						i:=i+1;
					end;
					writeln('> pembacaan file selesai');
				end;
			6 :
				begin
					i :=1;
					writeln('> File pembelian');
					writeln('> load');
					write('> nama file : ');
					readln(namaFile);
					assign(fbeli,namaFile);
					lbeli.neff := 0;
					reset(fbeli);
					while (not eof(fbeli)) and (i>=401) do
					begin
						read(fbeli,beli);
						lbeli.pembelian[i] := beli;
						i:=i+1;
						lbeli.neff:=lbeli.neff+1;
					end;
					writeln('> pembacaan file selesai');
				end;
			7 :
				begin
					i :=1;
					writeln('> File nilai tukar');
					writeln('> load');
					write(' nama file : ');
					readln(namaFile);
					assign(fnt,namaFile);
					lnt.neff := 0;
					reset(fnt);
					while (not eof(fnt)) and (i>=401) do
					begin
						read(fnt,nt);
						lnt.nilaiTukar[i] := nt;
						i:=i+1;
						lnt.neff:=lnt.neff+1;
					end;
					writeln('> pembacaan file selesai');
				end;
			8 :
				begin
					loop := false;
				end;
		end;
	end;
end;

Procedure login(arrayN : ListNasabah; var NoNasabah : string); //Login(ListNasabah.Nasabah,currentLocation)
var i,Loc: integer; //Loc adalah lokasi account pada array, dan i adalah variable untuk menghitung keatas
	Found: boolean; //Found menentukan apakah account tersebut ada dan login benar atau tidak
	Att: array [1..100] of integer; //Att menyimpan akun mana yang telah gagal login
	User, Pass: string;
Begin
	writeln('> Login');
	for i:=1 to 100 do //semua account di-set dengan 0 pelanggaran atau gagal login 
	Att[i]:=0;
	repeat //proses login diulang sampai berhasil
	Begin
		Found:= False; //
		i:=1; //
		Loc:= 0; //semua variabel diset dalam posisi salah
		while ((i <= ArrayN.Neff) and (Loc = 0)) do //pencarian akan berhenti saat i melewati data terakhir dalam array, atau lokasi ditemukan
		Begin
			write('> Username: ');
			readln(user);
			write('> Password: ');
			readln(pass);
			if (ArrayN.nasabah[i].Username = User)then //saat username ditemukan
				Begin
					Loc:=i; //lokasi di-set
					if (ArrayN.nasabah[i].Password = pass) then
						if (ArrayN.nasabah[Loc].Status='tidak aktif') then 
						begin
						Found :=false;
						end else
						Found:=True; //jika password benar maka login benar	
				end;
			i:=i+1; //i naik 1 setiap sebuah lokasi di array selesai dicari
		end;
		if (ArrayN.nasabah[Loc].Status='tidak aktif') then 
		begin
			writeln('> Akun anda sudah tidak aktif');
		end else
		if ((Loc>0) and not(Found)) then //jika username ada dan password salah
		Begin
			Writeln('> Password anda salah');
			Att[Loc]:=Att[Loc]+1; //username itu mendapat peringatan
			if Att[Loc]=3 then //jika peringatan =3
			begin
				ArrayN.nasabah[Loc].Status:='tidak aktif'; //akun di-set tidak aktif
				writeln('> Akun anda sudah tidak aktif lagi karena telah salah memasukkan password sebanyak 3 kali!');
			end;
		end;

		if Loc=0 then //jika username tidak ditemukan
			writeln('Username tidak ditemukan');
	end;
	until ((Loc>0) and (Found)); //kondisi berhenti untuk repeat
	Writeln('> Login berhasil!');
	NoNasabah:=arrayN.nasabah[Loc].NomorNasabah; //value fungsi login sama dengan lokasi user pada array, dan selanjutnya dapat disimpan di currentLocation
end;

procedure perubahanDataNasabah(NoNasabah: string; ln:ListNasabah); 

var
	i,Loc : integer;
	
Begin
	writeln('> Perubahan data nasabah');
	Loc :=0;
	for i:=1 to (ln.Neff) do
	begin
		if (ln.nasabah[Loc].NomorNasabah = NoNasabah) then Loc := i;
	end;
	writeln('> Masukkan data yang baru');
	write('> Nama Nasabah: ');
	readln(ln.nasabah[Loc].NamaNasabah);
	write('> Alamat: ');
	readln(ln.nasabah[Loc].alamat);
	write('> Kota: ');
	readln(ln.nasabah[Loc].kota);
	write('> E-mail: ');
	readln(ln.nasabah[Loc].email);
	write('> Nomor Telepon: ');
	readln(ln.nasabah[Loc].NomorTelp);
	write('> Password: ');
	readln(ln.nasabah[Loc].Password);
	ln.nasabah[Loc].status :='aktif';
end;

Procedure lihatRekening(noNasabah:string; X : listRekening);
var
	jumlahRek, i : integer;
begin
	jumlahRek:= 0;
	writeln('> Daftar Rekening :');
	if (X.neff > 0) then
	begin
		for i:= 1 to X.Neff do
		begin
			if (noNasabah = X.rekening[i].nomorNasabah) then
			begin
				jumlahRek:= jumlahRek+1;
				writeln('> ', jumlahRek,'. ', X.rekening[i].jenisrekening,' | No.Akun : ', X.rekening[i].nomorAkun);
			end;
		end;
	end else writeln('> Anda tidak memiliki rekening');
end;

Procedure pilihanRekening(n : integer; X : listRekening);
var
	i, j : integer;
begin
	j:= 0;
	if (n = 1) then
	begin
		for i:= 1 to X.neff do
		begin
			if (X.rekening[i].jenisrekening = 'tabungan mandiri') then
			begin
				j:= j+1;
				writeln('> ', j, '. ', X.rekening[i].nomorAkun);
			end;
		end;
		if (j = 0) then
		begin
			writeln('> Anda tidak memiliki tabungan mandiri');
		end;
	end
	else if (n = 2) then
	begin
		for i:= 1 to X.neff do
		begin
			if (X.rekening[i].jenisrekening = 'deposito') then
			begin
				j:= j+1;
				writeln('> ', j, '. ', X.rekening[i].nomorAkun);
			end;
		end;
		if (j = 0) then
		begin
			writeln('> Anda tidak memiliki deposito');
		end;
	end
	else if (n = 3) then
	begin
		for i:= 1 to X.neff do
		begin
			if (X.rekening[i].jenisrekening = 'tabungan rencana') then
			begin
				j:= j+1;
				writeln('> ', j, '. ', X.rekening[i].nomorAkun);
			end;
		end;
		if (j = 0) then
		begin
			writeln('> Anda tidak memiliki tabungan mandiri');
		end;
	end;
end;

Procedure setor(var X : listRekening; Y : listSetoran);
var
	nominal : real;
	akun : string;
	num, i, new, place : integer;
	found : boolean;
	
begin
	writeln ('> Penyetoran');
	writeln ('> Pilih jenis rekening :');
	writeln ('> 1. Deposito');
	writeln ('> 2. Tabungan Rencana');
	writeln ('> 3. Tabungan Mandiri');
	write ('> Jenis rekening: '); 
	readln (num);
	pilihanRekening(num, X);
	repeat
		write('> Masukkan nomor Akun tujuan pensetoran : ');
		readln(akun);
		for i:= 1 to X.neff do
			begin
			if (akun = X.rekening[i].nomorAkun) then
			begin
				place:= i;
				found:= true;
			end;
		end;
		if (found = false) then writeln('> Nomor rekening tidak valid. Harap coba lagi.');
	until (found = true);
	write('> Masukkan jumlah uang yang ingin Anda setor : ');
	readln(nominal);
	while (nominal < 0) do
	begin
		writeln('> ERROR : Nominal tidak valid');
		write('> Masukkan jumlah uang yang ingin Anda setor : ');
		readln(nominal);
	end;
	X.rekening[place].saldo:= X.rekening[place].saldo + nominal;
	Y.neff:= Y.neff+1;
	new:= Y.neff;
	Y.setoran[new].nomorAkun:= X.rekening[place].nomorAkun;
	Y.setoran[new].jenisTransaksi:= 'setoran';
	Y.setoran[new].mataUang:= X.rekening[place].mataUang;
	Y.setoran[new].jumlah:= nominal;
	Y.setoran[new].saldo:= X.rekening[place].saldo;
	Y.setoran[new].tanggalTransaksi:= DateToStr(Date);
	writeln('> Transaksi Berhasil');
end;

Function valiDate(tglKini : TDateTime; tglTransaksi : TDateTime; periode : integer) : boolean;
var
	x, y, selisih : integer;
	valid : boolean;
begin
	x:= Round(tglKini);
	y:= Round(tglTransaksi);
	selisih:= x - y;
	if (selisih <= periode) and (selisih >= 1) then
	begin
		valid:= true;
		valiDate:= valid;
	end else
	begin
		valid:= false;
		valiDate:= valid;
	end;
end;

Procedure lihatAktifitasTransaksi(X : listRekening; A : listSetoran; B : listTransfer; C : listPembayaran; D : listPembelian);
{KAMUS LOKAL}
var
	value, i, periode, num, kosong : integer;
	isValid : boolean;
	found : boolean;
	akun, unitOfDay : string;
	tglTransaksi : TDateTime;
	
{ALGORITMA}
begin
	writeln('> Lihat Aktivitas Transaksi');
	writeln ('> Pilih jenis rekening :');
	writeln ('> 1. Deposito');
	writeln ('> 2. Tabungan Rencana');
	writeln ('> 3. Tabungan Mandiri');
	write ('> Jenis rekening: '); 
	readln (num);
	pilihanRekening(num, X);
	repeat
		write('> Masukkan nomor Akun : ');
		readln(akun);
		for i:= 1 to X.neff do
			begin
			if (akun = X.rekening[i].nomorAkun) then
			begin
				found:= true;
			end;
		end;
		if (found = false) then writeln('> Nomor rekening tidak valid. Harap coba lagi.');
	until (found = true);
	isValid:= true;
	writeln('> Jangka waktu data yang dapat ditampilkan adalah 1 hari sampai 3 bulan.');
	repeat
		writeln('> Jangka waktu transaksi yang ingin ditampilkan : ');
		write('> '); readln(value,unitOfDay);
		if (unitOfDay = ' bulan') and (value <= 3) and (value >= 0) then
		begin
			periode:= value*30;
		end
		else if (unitOfDay = ' hari') and (value >= 0) then
		begin
			periode:= value;
		end else
		begin
			isValid:= false;
		end;
		if (isvalid = false) then
		begin
			writeln('> ERROR : Jangka waktu tidak valid.');
		end;
	until (isValid = true);
	kosong:= 0;
	if (A.neff > 0) then
	begin
		writeln('> Transaksi setoran/penyetoran : ');
		for i:= 1 to A.neff do
		begin
			tglTransaksi:= StrToDate(A.setoran[i].tanggalTransaksi);
			if (valiDate(Date, tglTransaksi, periode) = true) and (akun = A.setoran[i].nomorAkun) then
			begin
				writeln('> Jenis transaksi : ', A.setoran[i].jenisTransaksi);
				writeln('> Mata uang : ', A.setoran[i].mataUang);
				writeln('> Jumlah :',  A.setoran[i].jenisTransaksi, ' : ', A.setoran[i].jumlah:0:2);
				writeln('> Saldo akhir : ', A.setoran[i].saldo:0:2);
				writeln('> Tanggal transaksi : ', A.setoran[i].tanggalTransaksi);
				writeln;
			end;
		end;
	end else kosong:= kosong + 1;
	if (B.neff > 0) then
	begin
		writeln('> Transaksi transfer : ');
		for i:= 1 to B.neff do
		begin
			tglTransaksi:= StrToDate(B.transfer[i].tanggalTransaksi);
			if (valiDate(Date, tglTransaksi, periode) = true) and (akun = B.transfer[i].nomorAkunAsal) then
			begin
				writeln('> Akun tujuan : ', B.transfer[i].nomorAkuntujuan);
				writeln('> Jenis transfer : ', B.transfer[i].jenisTransfer);
				writeln('> Bank tujuan : ', B.transfer[i].namaBankLuar);
				writeln('> Mata uang : ', B.transfer[i].mataUang);
				writeln('> Jumlah : ', B.transfer[i].jumlah:0:2);
				writeln('> Saldo akhir : ', B.transfer[i].saldo:0:2);
				writeln('> Tanggal transaksi : ', B.transfer[i].tanggalTransaksi);
				writeln;
			end;
		end;
	end else kosong:= kosong + 1;
	if (C.neff > 0) then
	begin
		writeln('> Transaksi pembayaran :');
		for i:= 1 to C.neff do
		begin
			tglTransaksi:= StrToDate(C.pembayaran[i].tanggalTransaksi);
			if (valiDate(Date, tglTransaksi, periode) = true) and (akun = C.pembayaran[i].nomorAkun) then
			begin
				writeln('> Jenis Transaksi : ', C.pembayaran[i].jenisTransaksi);
				writeln('> Rekening bayar : ', C.pembayaran[i].rekeningBayar);
				writeln('> Mata uang : ', C.pembayaran[i].mataUang);
				writeln('> Jumlah : ', C.pembayaran[i].jumlah:0:2);
				writeln('> Saldo Akhir : ', C.pembayaran[i].saldo:0:2);
				writeln('> Tanggal transaksi : ', C.pembayaran[i].tanggalTransaksi);
				writeln;
			end;
		end;
	end else kosong:= kosong + 1;
	if (D.neff > 0) then
	begin
		writeln('> Transaksi pembelian :');
		for i:= 1 to A.neff do
		begin
			tglTransaksi:= StrToDate(D.pembelian[i].tanggalTransaksi);
			if (valiDate(Date, tglTransaksi, periode) = true) and (akun = D.pembelian[i].nomorAkun) then
			begin
				writeln('> Jenis Barang : ', D.pembelian[i].jenisBarang);
				writeln('> Penyedia : ', D.pembelian[i].penyedia);
				writeln('> Nomor Tujuan : ', D.pembelian[i].nomorTujuan);
				writeln('> Mata uang : ', D.pembelian[i].mataUang);
				writeln('> Jumlah : ', D.pembelian[i].jumlah:0:2);
				writeln('> Saldo Akhir : ', D.pembelian[i].saldo:0:2);
				writeln('> Tanggal transaksi : ', D.pembelian[i].tanggalTransaksi);
			end;
		end;
	end else kosong:= kosong + 1;
	if (kosong = 4) then writeln('> Tidak ada transaksi dalam jangka waktu ', value, unitOfDay, ' terakhir');
end;

procedure penambahanAutoDebet(noNasabah : string; var  lr : listRekening);
var
	found1, found2 			: boolean;
	nomandiri, noauto,lna, jenis 	: string;
	i,b 				: integer;
	
begin
	writeln('> Penambahan/perubahan Autodebet');
	found1 := false;
	found2 := false;
	writeln('> tuliskan nomor rekening yang mau diberi/diubah autodebetnya : ');
	readln(noauto);
	write('> tuliskan rekening mandiri yang mau dijadikan autodebet : ');
	readln(nomandiri);
	i := 1;
	while (not found1) and (not found2) and (i<=lr.neff) do
	begin
		lna:= lr.rekening[i].nomorAkun;
		jenis:= lr.rekening[i].jenisRekening;
		if (lna=noauto) and ((jenis = 'tabungan rencana') or (jenis = 'deposito')) then
		begin
			found1 := true;
			b:=i;
		end;
		if (lna=nomandiri) and (jenis = 'tabungan mandiri') then
		begin
			found2 := true;
		end;
		i := i+1;
	end;
	if found1 and found2 then
	begin
		lr.rekening[b].rekeningAutodebet := nomandiri;
	end
	else
	begin
		writeln('> perintah tidak bisa dilakukan karena nomor rekening tidak ada');
	end;
end;

procedure buatRekening(NoNasabah : string; var R : ListRekening);

var	
	chs,n,jw	: integer;
	saldo,setoran	: real;
	rekAuto		: string;
	i		: integer;

begin
writeln('> Buat Rekening');
repeat 
	writeln('> Pilih jenis rekening yang akan dibuat :');
	writeln('> 1. Tabungan Mandiri');
	writeln('> 2. Tabungan Rencana');
	writeln('> 3. Deposito');
	write('> Jenis rekening: ');
	readln(chs);
	writeln('>');
until (chs>0)and(chs<4);
case chs of
	1 : begin
		repeat
			writeln('> Untuk membat rekening ini, Anda harum memberikan setoran awal minimal Rp 50.000');
			write('> Masukkan setoran awal : Rp ');
			readln(saldo);
		until (saldo>=50000);	
		n := R.Neff+1;
		R.rekening[n].nomorAkun := '1XY0'+IntToStr(n);
		R.rekening[n].nomorNasabah := NoNasabah;
		R.rekening[n].jenisrekening := 'tabungan mandiri';
		R.rekening[n].mataUang := 'IDR';
		R.rekening[n].saldo := saldo;
		R.rekening[n].setoranrutin := 0;
		R.rekening[n].rekeningAutodebet := '-';
		R.rekening[n].jangkaWaktu := '-';
		R.rekening[n].tanggalMulai := DateToStr(Date);
		end;	
	2 : begin
		n := R.Neff+1;
		write('> Masukkan setoran awal : Rp ');
		readln(saldo);
		if (saldo<0) then 
		begin
			repeat
				writeln('> Masukkan angka  >= 0');
				write('> Masukkan setoran awal : Rp ');
				readln(saldo);
			until (saldo>=0);
		end;
		writeln('> Silahkan tentukan setoran bulanan yang Anda inginkan');
		repeat
			writeln('> Minimal Rp 500.000');
			write('> Masukkan jumlah setoran bulanan : Rp ');
			readln(setoran);
		until (setoran>=500000);
		i := 1;
		rekAuto := '-';
		while (i<n) and (rekAuto = '-') do
		begin
			if (R.rekening[i].nomorNasabah=R.rekening[n].nomorNasabah) and (R.rekening[i].jenisrekening = 'tabungan mandiri') then
			begin
				rekAuto := R.rekening[i].nomorAkun
			end;
			i:=i+1;
		end;
	
		writeln('> Silahkan tentukan jangka waktu tabungan yang Anda inginkan');
		repeat
			writeln('> Minimal 1 tahun');
			writeln('> Maksimal 20 tahun');
			write('> Jangka waktu tabungan dalam tahun: ');
			readln(jw);
		until (jw>=1)and(jw<=20);
				
		R.rekening[n].nomorAkun := '2XY0'+IntToStr(n);
		R.rekening[n].nomorNasabah := NoNasabah;
		R.rekening[n].jenisrekening := 'tabungan rencana';
		R.rekening[n].mataUang := 'IDR';
		R.rekening[n].saldo := saldo;
		R.rekening[n].setoranrutin := setoran;
		R.rekening[n].rekeningAutodebet := rekAuto;
		R.rekening[n].jangkaWaktu := IntToStr(jw)+' tahun';
		R.rekening[n].tanggalMulai := DateToStr(Date);
		end;
	3 : begin
		n :=R.Neff+1;
		writeln('> Kami menyediakan tiga jenis mata uang yang dapat anda gunakan :');
		writeln('> 1. IDR');
		writeln('> 2. USD');
		writeln('> 3. EUR');
		write('> Pilih mata uang yang ingin anda gunakan : ');
		readln(chs);
		while (chs<1)or(chs>3) do 
		begin
			writeln('> Masukkan angka 1-3');
			write('> Pilih mata uang yang ingin anda gunakan : ');
			readln(chs);
		end;
		case chs of
		1 : begin
			R.rekening[n].mataUang := 'IDR';
			repeat
				writeln('> Untuk membat rekening ini, Anda harum memberikan setoran awal minimal Rp 8.000.000');
				write('> Masukkan setoran awal : Rp ');
				readln(saldo);
			until (saldo>=8000000);
			end;
		2 : begin
			R.rekening[n].mataUang := 'USD';
			repeat
				writeln('> Untuk membat rekening ini, Anda harum memberikan setoran awal minimal USD 600');
				write('> Masukkan setoran awal : USD ');
				readln(saldo);
			until (saldo>=600);	
			end;	
		3 : begin
			R.rekening[n].mataUang := 'EUR';
			repeat
				writeln('> Untuk membat rekening ini, Anda harum memberikan setoran awal minimal EUR 550');
				write('> Masukkan setoran awal : EUR ');
				readln(saldo);
			until (saldo>=550);	
			end;
		end;	
		i := 1;
		rekAuto := '-';
		while (i<n) and (rekAuto = '-') do
		begin
			if (R.rekening[i].nomorNasabah=R.rekening[n].nomorNasabah) and (R.rekening[i].jenisrekening = 'tabungan mandiri') then
			begin
				rekAuto := R.rekening[i].nomorAkun
			end;
			i:=i+1;
		end;
		
		writeln('> Silahkan pilih jangka waktu tabungan yang Anda inginkan');
		writeln('> 1. 1 bulan');
		writeln('> 2. 3 bulan');
		writeln('> 3. 6 bulan');
		writeln('> 4. 12 bulan');
		write('> Pilihan : ');
		readln(chs);
		while (chs<1)or(chs>4) do 
		begin
			writeln('> Masukkan angka 1-4');
			write('> Pilihan : ');
			readln(chs);
		end;
		case chs of
		1 : begin
			jw := 1;
			end;
		2 : begin
			jw := 3;
			end;
		3 : begin
			jw := 6;
			end;
		4 : begin
			jw := 12;
			end;
		end;				
		R.rekening[n].nomorAkun := '3XY0'+IntToStr(n);
		R.rekening[n].nomorNasabah := NoNasabah;
		R.rekening[n].jenisrekening := 'deposito';
		R.rekening[n].saldo := saldo;
		R.rekening[n].setoranrutin := 0;
		R.rekening[n].rekeningAutodebet := rekAuto;
		R.rekening[n].jangkaWaktu := IntToStr(jw)+' bulan';
		R.rekening[n].tanggalMulai := DateToStr(Date);
		end;
	end;
end;

procedure tutupRekening(NoNasabah : string; var R: ListRekening);

{Kamus Lokal}
var
	delAkun 	: string;
	akunTrans	: string;
	i 			: integer;
	idel,itrans	: integer;
	found		: boolean;
{Algoritma prosedur}
begin
	writeln('> Tutup Rekening');
	lihatRekening(NoNasabah,R);
	found := False;
	repeat
		write('> Masukkan Nomor Akun yang akan dihapus : ');
		readln(delAkun);
		i := 1;
		while (i<=R.Neff) and (found=False) do
		begin	
			if ((delAkun)=(R.rekening[i].nomorAkun)) then
			begin
				found := True;
				idel  := i;
			end;
			i := i+1;
		end;
		if (found=False) then writeln('> Nomor Akun tidak ditemukan');
	until (found=True);
	
	found := False;
	repeat
		write('> Masukkan rekening tujuan untuk pemindahan saldo : ');
		readln(akunTrans);
		i := 1;
		while (i<=R.Neff) and (found=False) do
		begin	
			if ((delAkun)=(R.rekening[i].nomorAkun)) then
				begin
				found 	:= True;
				itrans  := i;
				end;
			i := i+1;
		end;
		if (found=False) then writeln('> Nomor Akun tidak ditemukan');	
	until (found=True);
	
	if ((R.rekening[itrans].jenisrekening)='tabungan mandiri') then
	begin
		R.rekening[itrans].saldo := R.rekening[itrans].saldo+R.rekening[idel].saldo-25000;
	end else if ((R.rekening[itrans].jenisrekening)='tabungan rencana') then
	begin
		if jatuhtempo(R.rekening[idel]) then
		begin
			R.rekening[itrans].saldo := R.rekening[itrans].saldo+R.rekening[idel].saldo-25000;
		end else
			R.rekening[itrans].saldo := R.rekening[itrans].saldo+R.rekening[idel].saldo-200000;
	end else if ((R.rekening[itrans].jenisrekening)='deposito') then
	begin
		if jatuhtempo(R.rekening[idel]) then
		begin
			R.rekening[itrans].saldo := R.rekening[itrans].saldo+R.rekening[idel].saldo-25000;
		end else
			R.rekening[itrans].saldo := R.rekening[itrans].saldo+R.rekening[idel].saldo-round(Date-StrToDate(R.rekening[idel].tanggalMulai))*10000;
	end;
	i := 0;
	while (i<(R.Neff-idel)) do
	begin
		R.rekening[idel+i]:=R.rekening[idel+i+1];
		i := i+1;
	end;
	R.Neff := R.Neff-1;
end;


procedure exitProgram (ln : listNasabah; lr : listRekening; ls : listSetoran;lt : listTransfer;lbyr : listPembayaran;lbeli : listPembelian;lnt : listNilaiTukar);
var
	fn : file of nasabah;
	fr : file of rekening;
	fs : file of setoran;
	ft : file of transfer;
	fbyr : file of pembayaran;
	fbeli : file of pembelian;
	fnt : file of nilaiTukar;
	n : nasabah;
	r :rekening;
	s : setoran;
	t : transfer;
	byr : pembayaran;
	beli : pembelian;
	nt : nilaiTukar;
	i : integer;
	loop : boolean;
begin
	assign(fn,'nasabah.txt');
	rewrite(fn);
	i:=1;
	while (i<=ln.neff) do
	begin
		n:= ln.nasabah[i];
		write(fn,n);
		i:= i+1;
	end;
	close(fn);
	assign(fr,'rekening.txt');
	rewrite(fr);
	i:=1;
	while (i <= lr.neff) do
	begin
		r:= lr.rekening[i];
		write(fr,r);
		i:= i+1;
	end;
	close(fr);
	assign(ft,'transfer.txt');
	rewrite(ft);
	i:=1;
	while (i <= lt.neff) do
	begin
		t:= lt.transfer[i];
		write(ft,t);
		i:= i+1;
	end;
	close(fr);
	assign(fbyr,'pembayaran.txt');
	rewrite(fbyr);
	i:=1;
	while (i <= lbyr.neff) do
	begin
		byr:= lbyr.pembayaran[i];
		write(fbyr,byr);
		i:= i+1;
	end;
	close(fbyr);
	assign(fbeli,'pembelian.txt');
	rewrite(fbeli);
	i:=1;
	while (i <= lbeli.neff) do
	begin
		beli:= lbeli.pembelian[i];
		write(fbeli,beli);
		i:= i+1;
	end;
	close(fbeli);
	assign(fs,'setoran.txt');
	rewrite(fs);
	i:=1;
	while (i <= ls.neff) do
	begin
		s:= ls.setoran[i];
		write(fs,s);
		i:= i+1;
	end;
	close(fs);
	assign(fnt,'nilai tukar.txt');
	rewrite(fnt);
	i:=1;
	while (i <= lnt.neff) do
	begin
		nt:= lnt.nilaiTukar[i];
		write(fnt,nt);
		i:= i+1;
	end;
	close(fnt);
end;

Procedure penarikan(NNasabah:string; var lRek:listRekening; lSet:listSetoran );
var
	i,Loc : Integer;
	tarik : real;
	jenisrek, noAkun : string;
Begin
	Loc:=0;
	repeat
	Begin
		lihatRekening(NNasabah, lRek);
		repeat
		write('> Masukkan no Akun: ');
		readln(noAkun);
		for i:=1 to 100 do
		begin
			if ((NNasabah = lRek.Rekening[i].NomorNasabah) and (noAkun = lRek.Rekening[i].nomorAkun)) then
				Loc:=i;
		end;
		if Loc=0 then writeln('> Rekening tidak ada')
		until (Loc >0);
		if (not(JatuhTempo(lRek.Rekening[Loc])) and (lRek.Rekening[Loc].jenisRekening<>'tabungan mandiri')) then //JatuhTempo parameternya mungkin belom bener
			Begin
				writeln('> Rekening belum jatuh tempo');
				i:=0;
			end;
	end;
	until (i>0);
	write('> Jumlah penarikan: ',lRek.Rekening[Loc].mataUang,' '); //contoh hasil penulisan Jumlah penarikan: USD xx
	readln(tarik);
	if (tarik > lRek.Rekening[Loc].saldo) then
		writeln('> Saldo tidak cukup')
	else begin
			lRek.Rekening[Loc].saldo := lRek.Rekening[Loc].saldo - tarik;
			writeln('> Penarikan uang berhasil');
			lSet.setoran[lSet.Neff+1].nomorAkun := noAkun;
			lSet.setoran[lSet.Neff+1].jenisTransaksi := 'penarikan';
			lSet.setoran[lSet.Neff+1].mataUang := lRek.rekening[Loc].mataUang;
			lSet.setoran[lSet.Neff+1].jumlah := tarik;
			lSet.setoran[lSet.Neff+1].saldo := lRek.Rekening[Loc].saldo;
			lSet.setoran[lSet.Neff+1].tanggalTransaksi := DateToStr(Date);
			lSet.Neff := lSet.Neff +1;
		end;
end;

Procedure TransferUang(User:string; var lRekening : ListRekening);
var	
	Jenis,bankLuar,Tujuan,uangPenerima : string;
	Trans: real;
	i, indeks, indeks2, nPenerima,nPengirim: integer;
	antarBank,Cukup : boolean;
Begin
	writeln('> Transfer uang');
	bankLuar:='---';
	antarBank:=false;
	Cukup:=false;
	nPengirim:=0;
	repeat
	Begin
		write('> Jenis tabungan yang ingin dipakai: ');
		readln(Jenis);
		for i:=1 to 100 do
		Begin
			if ((User = lRekening.Rekening[i].nomorNasabah) and (Jenis = lRekening.Rekening[i].jenisrekening))  then
				nPengirim:=i;
		end;
		if nPengirim=0 then writeln('> Tabungan tidak ditemukan');
	end;
	until nPengirim >0;
	nPenerima:=0;
	write('> Masukkan rekening tujuan transfer: ');
	readln(Tujuan);
	write('> Jenis rekening tujuan: ');
	readln(Jenis);
	for i:=1 to 100 do
	Begin
		if ((lRekening.Rekening[i].nomorNasabah = Tujuan) and (lRekening.Rekening[i].jenisrekening = Jenis)) then
			nPenerima:=i;
	end;
	if nPenerima = 0 then 
		begin
			antarBank:=True;
			write('> Masukkan nama bank luar: '); readln(bankLuar);
	end;
	if nPenerima = 0 then
		Begin
			write('> Masukkan mata uang penerima: ');
			readln(uangPenerima);
		end else uangPenerima := lRekening.Rekening[nPenerima].mataUang;
	write('> Jumlah yang ingin ditransfer: ');
	readln(trans);
		for i:=1 to 400 do
		Begin
			if ((lNilaiTukar.nilaiTukar[i].kursAsal= lRekening.Rekening[nPengirim].mataUang) and (lNilaiTukar.nilaiTukar[i].kursTujuan = uangPenerima)) then
				indeks:=i;
		end;
		if lRekening.Rekening[nPenerima].mataUang <> uangPenerima then
			trans:= trans + (2 * lNilaiTukar.nilaiTukar[indeks].nilaiKursTujuan / lNilaiTukar.nilaiTukar[indeks].nilaiKursAsal);
	if antarBank then
		Begin
			for i:=1 to 400 do
			Begin
				if ((lNilaiTukar.nilaiTukar[i].kursAsal='IDR') and (lNilaiTukar.nilaiTukar[i].kursTujuan=lRekening.Rekening[nPengirim].mataUang)) then
					indeks2 := i;
			end;
		trans:= trans + ((5000 / lNilaiTukar.nilaiTukar[indeks2].nilaiKursAsal) * lNilaiTukar.nilaiTukar[indeks2].nilaiKursTujuan);
	if lRekening.Rekening[nPengirim].jenisrekening <> 'tabungan mandiri' then
	begin
		if JatuhTempo(lRekening.Rekening[nPengirim]) then
		begin
			if lRekening.Rekening[nPengirim].saldo >= trans then
				begin
					lTransfer.transfer[lTransfer.Neff].nomorAkunAsal:= lRekening.Rekening[nPengirim].nomorAkun;
					lTransfer.transfer[lTransfer.Neff].nomorakuntujuan:=Tujuan;
					if antarBank then 
						lTransfer.transfer[lTransfer.Neff].jenisTransfer:='antar bank'
					else lTransfer.transfer[lTransfer.Neff].jenisTransfer:='dalam bank';
					lTransfer.transfer[lTransfer.Neff].namaBankLuar:=bankLuar;
					lTransfer.transfer[lTransfer.Neff].mataUang:=uangPenerima;
					lTransfer.transfer[lTransfer.Neff].jumlah:=trans;
					lRekening.Rekening[nPengirim].saldo:= lRekening.Rekening[nPengirim].saldo - trans;
					lTransfer.transfer[lTransfer.Neff].saldo:= lRekening.Rekening[nPengirim].saldo;
					lTransfer.transfer[lTransfer.Neff].tanggalTransaksi:= datetostr(Date);
					lTransfer.Neff:=lTransfer.Neff + 1;
				end else writeln('> Saldo tidak cukup');
		end else writeln('> Rekening belum jatuh tempo');
	end else 
		if lRekening.Rekening[nPengirim].saldo >= trans then
				begin
					lTransfer.transfer[lTransfer.Neff].nomorAkunAsal:= lRekening.Rekening[nPengirim].nomorAkun;
					lTransfer.transfer[lTransfer.Neff].nomorakuntujuan:=Tujuan;
					if antarBank then 
						lTransfer.transfer[lTransfer.Neff].jenisTransfer:='antar bank'
						else lTransfer.transfer[lTransfer.Neff].jenisTransfer:='dalam bank';
					lTransfer.transfer[lTransfer.Neff].namaBankLuar:=bankLuar;
					lTransfer.transfer[lTransfer.Neff].mataUang:=uangPenerima;
					lTransfer.transfer[lTransfer.Neff].jumlah:= trans;
					lRekening.Rekening[nPengirim].saldo:= lRekening.Rekening[nPengirim].saldo - trans;
					lTransfer.transfer[lTransfer.Neff].saldo:= lRekening.Rekening[nPengirim].saldo;
					lTransfer.transfer[lTransfer.Neff].tanggalTransaksi:= datetostr(Date);
					lTransfer.Neff:=lTransfer.Neff + 1;
				end else writeln('> Saldo tidak cukup');
		end;
end;

procedure bayar(noNasabah : string; lr : listRekening; var lbyr : listPembayaran);
var
	jenis, rekbyr, noakun,tgl: string;
	nominal, denda, saldo : real;
	yy, mm, dd : word;
	found:boolean;
	urutan, i,b : integer;
begin
	found:=false;
	writeln('> Pembayaran');
	repeat
		write('> Masukkan nomor Akun tujuan pensetoran : ');
		readln(noakun);
		for i:= 1 to lr.neff do
			begin
			if (noakun = lr.rekening[i].nomorAkun) and jatuhTempo(lr.rekening[i]) then
			begin
				urutan:= i;
				found:= true;
			end;
		end;
		if (found = false) then writeln('> Nomor rekening tidak valid atau belum jatuh tempo. Harap coba lagi.');
	until (found = true);
	write('> Tulikan pembayaran yang mau dilakukan : ');
	readln(jenis);
	write('> Tuliskan nominal pembayaran : ');
	readln(nominal);
	write('> Tuliskan rekening bayar : ');
	readln(rekbyr);
	if (jenis='listrik') or (jenis='PDAM') or (jenis='telepon') or (jenis='kartu kredit') or (jenis='pajak') or (jenis='biaya pendidikan') then
	begin
		if lr.rekening[urutan].mataUang = 'USD' then
		begin
			saldo:=lr.rekening[urutan].saldo*13300;
		end
		else if lr.rekening[urutan].mataUang = 'EUR' then
		begin
			saldo:=lr.rekening[urutan].saldo / 0.94 * 13300;
		end;
		decodedate(date,yy,mm,dd);
		denda:=0;
		if (dd>=15) then
		begin
			denda:=(dd-14)*10000;
		end;
		nominal:=nominal+denda;
		if (saldo>=nominal) then
		begin
			saldo:= saldo-nominal;
			if lr.rekening[urutan].mataUang = 'USD' then
				lr.rekening[urutan].saldo := saldo / 13300
			else if lr.rekening[urutan].mataUang = 'EUR' then
				lr.rekening[urutan].saldo := saldo / 13300 * 0.94
			else
				lr.rekening[urutan].saldo := saldo;
			b:= lbyr.neff+1;
			lbyr.pembayaran[b].nomorAkun := lr.rekening[urutan].nomorAkun;
			lbyr.pembayaran[b].jenistransaksi := jenis;
			lbyr.pembayaran[b].rekeningBayar := rekbyr;
			lbyr.pembayaran[b].mataUang := lr.rekening[urutan].mataUang;
			lbyr.pembayaran[b].jumlah := nominal;
			lbyr.pembayaran[b].saldo := lr.rekening[urutan].saldo;
			tgl:=datetostr(date);
			lbyr.pembayaran[b].tanggalTransaksi := tgl;
			writeln('> pembayarn telah berhasil');
			writeln('> nomor akun : ',lbyr.pembayaran[b].nomorAkun);
			writeln('> jenis transaksi : ',lbyr.pembayaran[b].jenistransaksi);
			writeln('> rekening pembayaran : ',lbyr.pembayaran[b].rekeningBayar);
			writeln('> mata uang : ',lbyr.pembayaran[b].mataUang);
			writeln('> jumlah dengan denda jika ada : ',lbyr.pembayaran[b].jumlah:5:2);
			writeln('> saldo akhir : ',lbyr.pembayaran[b].saldo:5:2);
			writeln('> tangga transaksi : ',lbyr.pembayaran[b].tanggalTransaksi);
		end
		else
			writeln('> saldo anda tidak mencukupi.');
	end
	else
		writeln('> Masukan anda salah');
end;

procedure menu;
var
	loop : boolean;
	a : integer;
begin
	writeln('> Program perbankan');
	load(lNasabah,lRekening,lSetoran,lTransfer,lPembayaran,lPembelian,lNilaiTukar);
	
	
end;
{program utama}
begin
	menu; 
	login(lNasabah,NoNasabah);
	tulismenu;
	writeln('> Masukkan pilihan : ');
	readln(chs);
	while (chs<1) or (chs>13) do
	begin
		writeln('> Ulangi masukkan pilihan : ');
		readln(chs);	
	end;
	case chs of
	1 : begin
		lihatRekening(NoNasabah, lRekening);
	    end;
	2 : begin
		InformasiSaldo (lRekening);
	    end;
	3 : begin
		lihatAktifitasTransaksi(lRekening, lSetoran, lTransfer, lPembayaran, lPembelian);
	    end;
	4 : begin
		buatRekening(NoNasabah, lRekening);
	    end;
	5 : begin
		setor(lRekening, lSetoran);
	    end;
	6 : begin
		penarikan(NoNasabah, lRekening, lSetoran);
	    end;
	7 : begin
		TransferUang(NoNasabah, lRekening);
	    end;
	8 : begin
		bayar(NoNasabah, lRekening, lPembayaran);
	    end;
	9 : begin
		
	    end;
	10 : begin
		tutupRekening(NoNasabah, lRekening);
	     end;
	11 : begin
		perubahanDataNasabah(NoNasabah,lNasabah);
	     end;
	12 : begin
		penambahanAutoDebet(NoNasabah, lRekening);
	     end;
	13 : begin
		exitProgram (lNasabah, lRekening, lSetoran, lTransfer, lPembayaran ,lPembelian, lNilaiTukar);
	     end;
	end;
end.
