FILE="/home/vagrant/.ssh/id_rsa"
echo "Installing private key ($FILE)..."
echo '-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzI
w+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoP
kcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2
hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NO
Td0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcW
yLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQIBIwKCAQEA4iqWPJXtzZA68mKd
ELs4jJsdyky+ewdZeNds5tjcnHU5zUYE25K+ffJED9qUWICcLZDc81TGWjHyAqD1
Bw7XpgUwFgeUJwUlzQurAv+/ySnxiwuaGJfhFM1CaQHzfXphgVml+fZUvnJUTvzf
TK2Lg6EdbUE9TarUlBf/xPfuEhMSlIE5keb/Zz3/LUlRg8yDqz5w+QWVJ4utnKnK
iqwZN0mwpwU7YSyJhlT4YV1F3n4YjLswM5wJs2oqm0jssQu/BT0tyEXNDYBLEF4A
sClaWuSJ2kjq7KhrrYXzagqhnSei9ODYFShJu8UWVec3Ihb5ZXlzO6vdNQ1J9Xsf
4m+2ywKBgQD6qFxx/Rv9CNN96l/4rb14HKirC2o/orApiHmHDsURs5rUKDx0f9iP
cXN7S1uePXuJRK/5hsubaOCx3Owd2u9gD6Oq0CsMkE4CUSiJcYrMANtx54cGH7Rk
EjFZxK8xAv1ldELEyxrFqkbE4BKd8QOt414qjvTGyAK+OLD3M2QdCQKBgQDtx8pN
CAxR7yhHbIWT1AH66+XWN8bXq7l3RO/ukeaci98JfkbkxURZhtxV/HHuvUhnPLdX
3TwygPBYZFNo4pzVEhzWoTtnEtrFueKxyc3+LjZpuo+mBlQ6ORtfgkr9gBVphXZG
YEzkCD3lVdl8L4cw9BVpKrJCs1c5taGjDgdInQKBgHm/fVvv96bJxc9x1tffXAcj
3OVdUN0UgXNCSaf/3A/phbeBQe9xS+3mpc4r6qvx+iy69mNBeNZ0xOitIjpjBo2+
dBEjSBwLk5q5tJqHmy/jKMJL4n9ROlx93XS+njxgibTvU6Fp9w+NOFD/HvxB3Tcz
6+jJF85D5BNAG3DBMKBjAoGBAOAxZvgsKN+JuENXsST7F89Tck2iTcQIT8g5rwWC
P9Vt74yboe2kDT531w8+egz7nAmRBKNM751U/95P9t88EDacDI/Z2OwnuFQHCPDF
llYOUI+SpLJ6/vURRbHSnnn8a/XG+nzedGH5JGqEJNQsz+xT2axM0/W/CRknmGaJ
kda/AoGANWrLCz708y7VYgAtW2Uf1DPOIYMdvo6fxIB5i9ZfISgcJ/bbCUkFrhoH
+vq/5CIWxCPp0f85R4qxxQ5ihxJ0YDQT9Jpx4TMss4PSavPaBH3RXow5Ohe+bYoQ
NE5OgEXk2wVfZczCZpigBKbKZHNYcelXtTt/nP3rsCuGcM4h53s=
-----END RSA PRIVATE KEY-----
' > $FILE
chmod 600 $FILE
chown vagrant:vagrant $FILE
echo '...installed'

FILE="/home/vagrant/.ssh/known_hosts"
echo "Installing known hosts ($FILE)..."
echo '
192.168.56.11 ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA8h0Dh8gz9+3hTj0/A+S9NGcF75e11zfzhcoOHvExcUn+HQWYc/7seGGenQfP9R+qbbALUt0QfHNQZT7/ui2t9Re/PUi8sam0nnhiI1gDfh+Ulk/sb1S1KpWk1ELdBfzA/Yl/vLDkYVzhP0tLU+HwHYc4EAk8Cx7hAA/Fw2e3mqV47ICHfFZ4/5uLm9lT2881rrkfzTNWFtXre8or7Hj23yeSKEOxHrzahjQUZWxDlGzOEToIIJwzD6pCDwslk0jcy1avHg5S4fQ1qNJItyaDytivXMlg1qF1Jhds9Ij+yhmj54O1HOcvyEttpZmdhItQudytrDFQ5NKwknIlVfQApw==
192.168.56.21 ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA8h0Dh8gz9+3hTj0/A+S9NGcF75e11zfzhcoOHvExcUn+HQWYc/7seGGenQfP9R+qbbALUt0QfHNQZT7/ui2t9Re/PUi8sam0nnhiI1gDfh+Ulk/sb1S1KpWk1ELdBfzA/Yl/vLDkYVzhP0tLU+HwHYc4EAk8Cx7hAA/Fw2e3mqV47ICHfFZ4/5uLm9lT2881rrkfzTNWFtXre8or7Hj23yeSKEOxHrzahjQUZWxDlGzOEToIIJwzD6pCDwslk0jcy1avHg5S4fQ1qNJItyaDytivXMlg1qF1Jhds9Ij+yhmj54O1HOcvyEttpZmdhItQudytrDFQ5NKwknIlVfQApw==
192.168.56.22 ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA8h0Dh8gz9+3hTj0/A+S9NGcF75e11zfzhcoOHvExcUn+HQWYc/7seGGenQfP9R+qbbALUt0QfHNQZT7/ui2t9Re/PUi8sam0nnhiI1gDfh+Ulk/sb1S1KpWk1ELdBfzA/Yl/vLDkYVzhP0tLU+HwHYc4EAk8Cx7hAA/Fw2e3mqV47ICHfFZ4/5uLm9lT2881rrkfzTNWFtXre8or7Hj23yeSKEOxHrzahjQUZWxDlGzOEToIIJwzD6pCDwslk0jcy1avHg5S4fQ1qNJItyaDytivXMlg1qF1Jhds9Ij+yhmj54O1HOcvyEttpZmdhItQudytrDFQ5NKwknIlVfQApw==
' > $FILE
chmod 644 $FILE
chown vagrant:vagrant $FILE
echo '...installed'

FILE="/etc/ssh/ssh_host_rsa_key"
echo "Installing known hosts ($FILE)..."
echo '-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEA8h0Dh8gz9+3hTj0/A+S9NGcF75e11zfzhcoOHvExcUn+HQWY
c/7seGGenQfP9R+qbbALUt0QfHNQZT7/ui2t9Re/PUi8sam0nnhiI1gDfh+Ulk/s
b1S1KpWk1ELdBfzA/Yl/vLDkYVzhP0tLU+HwHYc4EAk8Cx7hAA/Fw2e3mqV47ICH
fFZ4/5uLm9lT2881rrkfzTNWFtXre8or7Hj23yeSKEOxHrzahjQUZWxDlGzOEToI
IJwzD6pCDwslk0jcy1avHg5S4fQ1qNJItyaDytivXMlg1qF1Jhds9Ij+yhmj54O1
HOcvyEttpZmdhItQudytrDFQ5NKwknIlVfQApwIBIwKCAQAbq4tf+Z+KDI7HHPFC
Rgb+rLA4o5/A0zHGJbh4kJfvsK9TxiANQbSgCygR8kOm/E396DvO9LFtTwHfr22u
4KYqo6DTzcxsE2UZbNgECg8HGY1TAdHg1nsaz0YJoT3UzG3T1TMrge43A0zxSm8C
RbUKsF4tt+ma3vUklBaZ/TmOBA9tbNT0l36bouwmBgA/mzKTRFwVkkVt28SCcYhQ
Oe1bC34RzPQADi9pCLf1z5XaieQsh9n/7bSnfnSYlyWuGm4/9J+hxEn4ENcm0c+C
rfXic/NEox6nYK8mvO64CvK4HDHKoJ3+2Gb5cx/C4dLL9EuDODR8aQjRCK6E5HRU
zFDrAoGBAPrVUWND4vJGmDDQRvjnRvWSKt7galoBrgajTmMZAmcpWfpJ2n5eajRy
n6rcMZUABX88KOlSYKjLBgWV1u2hrj0IRuDBdko0/SEfceDPkrLT1bEOp7n57/ai
+1BrbEWvS18SYhu1R118aTlKkcT+TOfzqh1+QlL5xtNoptJI1vKrAoGBAPcZttzc
RfLnMch+3djH+kWT+BswCRyT5O1jGmAVe7LZKQjCp9u/1oc8iB/iYk9cMMJPbGtO
252LEcBCCa4+M1sTc1mVIoFyY7n1tJAwIal5jG21jlqkI4HwJvO+vO1P15EoJDLx
uk1FMt5xz+QNpNQKBsTtV/DF/+Ye/FknIUn1AoGBAIgqqIZYDXw084g2jO2E3WC9
D/VVQQxKDgOaewKYjEaha1v8NMhB4eH1FNkYcq/4sobmJNZujD5flY4A4mO+K2L1
3VVwVihIpquUuimVQQH996lCeE8EBexJ2OKDdUpmeV9/Ag8KoxV+DTxbrje9P7Ed
4AFhzDusKhr+S+5/UB1VAoGAP4pE9vbQKISXxdd63/jolYxy/61EK+uEAocyqv41
wEZ4RBTME++ATqkqUVd4XYy8FLVWZLyBnYopIs8nD4xWWT+ED7iieQ7JL9F3ksqM
UCaR0xFtv4lK9YblceCW+zHJt5ybmBJF2Vrv0szPDsGuCqN+FWGaRTo6fQCnSiAB
PucCgYEAtr/xMIPcG5hvkvPJElIGUFtWB4a9r043KXn5WlGJluh9KBsLUfs3KZec
twJGCcdGKP1zuBT97MnnK+k61D2d1GpNpwlxIkmdb81DO8VA+kh6jW+N6Ia/yxj6
SfRmtfZroI6ltZYq9ztmHCyK9QziHuPpU07gWBCSIF+rGhYSSsw=
-----END RSA PRIVATE KEY-----
' > $FILE
chmod 600 $FILE
echo '...installed'

FILE="/etc/ssh/ssh_host_rsa_key.pub"
echo "Installing known hosts ($FILE)..."
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA8h0Dh8gz9+3hTj0/A+S9NGcF75e11zfzhcoOHvExcUn+HQWYc/7seGGenQfP9R+qbbALUt0QfHNQZT7/ui2t9Re/PUi8sam0nnhiI1gDfh+Ulk/sb1S1KpWk1ELdBfzA/Yl/vLDkYVzhP0tLU+HwHYc4EAk8Cx7hAA/Fw2e3mqV47ICHfFZ4/5uLm9lT2881rrkfzTNWFtXre8or7Hj23yeSKEOxHrzahjQUZWxDlGzOEToIIJwzD6pCDwslk0jcy1avHg5S4fQ1qNJItyaDytivXMlg1qF1Jhds9Ij+yhmj54O1HOcvyEttpZmdhItQudytrDFQ5NKwknIlVfQApw==' > $FILE
chmod 644 $FILE
echo '...installed'

echo "Reloading SSH daemon for updated RSA keys..."
/etc/init.d/sshd reload
echo '...reloaded'
