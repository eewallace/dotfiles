#Quick file backups
cpbak() {
	cp $1{,.bak}
}

cpunbak() {
	cp $1{.bak,}
}
mvbak() {
	mv $1{,.bak}
}

mvunbak() {
	mv $1{.bak,}
}
