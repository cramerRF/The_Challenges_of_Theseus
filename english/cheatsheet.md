## Cheat sheet for the basque version

#### 1º Challenge

```bash
cat * > key
mkdir lock
mv key lock
```

#### 2º Challenge

```bash
cd lock
rm -rf -- !(small_red_key)
```

#### 3º Challenge

The following may take a little time

```bash
cd trash
find . ! -readable | xargs chmod +r
ls -aA | egrep "^\.?key_fragment" | sort | xargs cat > ../key
cd ..
mkdir lock
mv key lock
```

#### 4º Challenge

```bash
cd lock
sed -E "s/([^a-zA-Z]pin[^a-zA-Z])      /\1placed/g" -i key
```

#### 5º Challenge

```bash
COMMIT_HASH=$(git -C repo log --grep='^ready!!$' --pretty=format:"%H" -1)
TARGET_CONTENT=$(git -C repo show "$COMMIT_HASH":key)
diff repo/key - <<< "$TARGET_CONTENT"  > locksmith/change_file
```

#### 6º Challenge

The following may take a little time

```bash
mkdir lock
ln -s $(find $(pwd)/roots/ -perm 777 -name key) lock/key
```

#### 7º Challenge

```bash
mkdir lock
echo -ne 'Z\nZ\nZ' > lock/key
```

#### 8º Challenge

```bash
openssl genpkey -algorithm RSA -out giltza.pem -pkeyopt rsa_keygen_bits:4096
openssl rsa -pubout -in giltza.pem -out public_key.pem
openssl pkeyutl -encrypt -pubin -inkey public_key.pem -in jatorrizko_mezua -out mezu_enkriptatua.bin
mkdir sekretu_kutxa
mkdir sarraila
mv giltza.pem sarraila/
mv mezu_enkriptatua.bin sekretu_kutxa/
```

#### 9º Challenge

The following may take a little time

```bash
mkdir lock
wget http://port-of-athens.net/compressed.tar
DIRNAME=$(tar tf compressed.tar | head -1)
tar fx compressed.tar
cd uncompressed_directory/
TARFILE_FILENAME=$(ls | xargs file -F ' ' | grep "POSIX tar archive" | tr ' ' '\n' | head -1)
KEYFILE_FILENAME=$(tar tf $TARFILE_FILENAME)
tar xf $TARFILE_FILENAME
mv $KEYFILE_FILENAME ../lock
```

#### 10º Challenge

```bash
mkdir submission_box
cat > solution << END
#!/bin/bash
eval "\$1"
eval "\$2"
END
chmod +x solution
mv solution submission_box
```

#### 11º Challenge

```bash
mkdir aurkezpen_ontzia
cat > 2_1337_f0r_y0u << END
#!/bin/bash
if [ \$# -ne 1 ]
then
    echo Error, 2_1337_f0r_y0u must be run with exactly one argument
    exit 1
fi
figlet -- "\$1" | cowsay -n
END
chmod +x 2_1337_f0r_y0u
mv 2_1337_f0r_y0u aurkezpen_ontzia
```

#### 12º Challenge

```bash
mkdir sarraila
touch sarraila/~\$\^\(\|\\\ \ gala\ \ \"\'\<\>
```

#### 13º Challenge

```bash
mkdir aurkezpen_ontzia
cat > erantzuna << END
#!/bin/bash
for file in "\$@"
do
	touch -t 197001010000 "\$file" 2>/dev/null
done
END
chmod +x erantzuna
mv erantzuna aurkezpen_ontzia
```

#### 14º Challenge

```bash
mkdir sarraila 
groups Fedra | tr ' ' '\n' | tail -n +3 | sort | tr '\n' ' ' | sed 's/ $//' | xargs echo > sarraila/giltza
```

#### 15º Challenge

```bash
mkdir sarraila
echo "( $(ls ezurra/ | tr -d '\n' | wc -c) + $(ls ezurra/ | wc -l) ) /  2009" | bc > sarraila/giltza

```
