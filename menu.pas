program tubes;
	
procedure tulisMenu;
begin
	writeln('> menu:');
	writeln;
	writeln('> load ');
	writeln('> login');
	writeln('> lihatRekening ');
	writeln('> informasiSldo ');
	writeln('> lihatAktivitasTransaksi ');
	writeln('> pembuatanRekening ');
	writeln('> setoran ')
	writeln('> penarikan ');
	writeln('> transfer ');
	writeln('> pembayaran ');
	writeln('> pembelian ');
	writeln('> penutupanRekening ');
	writeln('> perubahanDataRekening ');
	writeln('> penambahanAutoDebet ');
	writeln('> exit ');
end;

procedure load;
begin


end;
procedure menu;
type
	nilaiTukar = record
		nilaiKursAsal : longint;
		kursAsal : string;
		nilaiKursTujuan : longint;
		kursTujuan : string;
	end;
	pembelian = record
		nomorAkun : string;
		jenisBarang : string;
		penyedia : string;
		nomorTujuan : string;
		mataUang : string;
		jumlah : longint;
		saldo : longint;
		tanggalTransaksi : string; 
	end;
	pembayaran = record
		nomorAkun : string;
		jenisTransaksi : string;
		rekeningBayar : string;
		mataUang :string;
		jumlah : longint;
		saldo : longint;
		tanggalTransaksi : string;
	end;
	transfer = record
		nomorAkunAsal : string;
		nomorAkuntujuan : string;
		jenisTransfer : string;
		namaBankLuar : string;
		mataUang : string;
		jumlah : longint; {?}
		saldo : longint; {?}
		tanggalTransaksi : string ; {?}
	end;
	setoran = record
		nomorAkun : string;{?}
		jenisTransaksi : string;
		mataUang : string;
		jumlah : longint;
		saldo : longint: {?}
		tanggalTransaksi : string;
	end;
	rekening = record
		nomorAkun : string;
		nomorNasabah : string;{?}
		jenisrekening : string;
		mataUang : string;
		saldo : longint;
		setoranRutin : longint;
		rekeningAutodebet : string;
		jangkaWaktu : string {ini paling tepat apa ya?}
		tanggalMulai : string {ini juga apa ya yang pas ?}
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


{program utama}
begin
	menu;
end.