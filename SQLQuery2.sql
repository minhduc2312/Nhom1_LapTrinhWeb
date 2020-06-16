alter proc LoadBanner
as
begin
	select t.*, b.NoiDung, l.TenLoai
	from Banner b, TRASUA t,LOAI l
	where b.MaTS = t.MaTS and t.MaLoai=l.MaLoai
end

create function DoanhThu (
@ngaybatdau date, @ngayketthuc date, @DoanhThu bigint out
as
begin
	set	@DoanhThu = (select sum(Soluong*Dongia)
	from CHITIETDONTHANG c, DONDATHANG d
	where c.MaDonHang = d.MaDonHang and d.Dathanhtoan = 1 and  d.Ngaydat between @ngaybatdau and @ngayketthuc)
	return @DoanhThu 
end

declare @ketqua bigint
exec DoanhThu @ngaybatdau='06/16/2020',