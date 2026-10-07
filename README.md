# set-ps1

تغییر پرامپت ترمینال (PS1) با نمایش IP فعلی اینترفیس شبکه.

```
root@192.168.1.10 ~#
user@192.168.1.10 ~$
```

## نصب سریع

```bash
git clone https://github.com/mabedini63/set-ps1.git
cd set-ps1
chmod +x install.sh set-ps1.sh
./install.sh
source ~/.bashrc
```

## استفاده

بعد از نصب، در هر ترمینال جدید فقط بزنید:

```bash
source ~/.set-ps1.sh
```

یا برای اجرای بدون نصب:

```bash
source ./set-ps1.sh
```

> ⚠️ **مهم:** باید با `source` اجرا شود، نه `./set-ps1.sh`
> چون PS1 فقط در shell جاری ست می‌شود.

## حذف

```bash
# حذف خطوط از bashrc
sed -i '/# >>> set-ps1 >>>/,/# <<< set-ps1 <<</d' ~/.bashrc
rm ~/.set-ps1.sh
```

## مجوز

MIT
