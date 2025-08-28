function openFormPekerjaan() {
    const body = document.querySelector("#isi")
    const popup = document.querySelector("#formpekerjaan")
    popup.style.display = "block";
    popup.classList.toggle= "container-xxl  "
    popup.style.position = "absolute";
    body.classList.toggle("blur")
    body.style.filter = "blur(5px)";
}
function openFormtmpb() {
    const body = document.querySelector("#isi")
    const popup = document.querySelector("#formtmpb")
    popup.style.display = "block";
    popup.classList.toggle= "container-xxl  "
    popup.style.position = "absolute";
    body.classList.toggle("blur")
    body.style.filter = "blur(5px)";
}
function openFormpk() {
    const body = document.querySelector("#isi")
    const popup = document.querySelector("#formpk")
    popup.style.display = "block";
    popup.classList.toggle= "container-xxl  "
    popup.style.position = "absolute";
    body.classList.toggle("blur")
    body.style.filter = "blur(5px)";
}
function openFormpkr() {
    const body = document.querySelector("#isi")
    const popup = document.querySelector("#formpkr")
    popup.style.display = "block";
    popup.classList.toggle= "container-xxl  "
    popup.style.position = "absolute";
    body.classList.toggle("blur")
    body.style.filter = "blur(5px)";
}
function openFormpr() {
    const body = document.querySelector("#isi")
    const popup = document.querySelector("#formpr")
    popup.style.display = "block";
    popup.classList.toggle= "container-xxl  "
    popup.style.position = "absolute";
    body.classList.toggle("blur")
    body.style.filter = "blur(5px)";
}
function openFormcba() {
    const body = document.querySelector("#isi")
    const popup = document.querySelector("#formcba")
    popup.style.display = "block";
    popup.classList.toggle= "container-xxl  "
    popup.style.position = "absolute";
    body.classList.toggle("blur")
    body.style.filter = "blur(5px)";
}
function openFormkjpp() {
    const body = document.querySelector("#isi")
    const popup = document.querySelector("#formkjpp")
    popup.style.display = "block";
    popup.classList.toggle= "container-xxl  "
    popup.style.position = "absolute";
    body.classList.toggle("blur")
    body.style.filter = "blur(5px)";
}
function closeformpekerjaan(){
    const body = document.querySelector("#isi")
    const popup = document.querySelector("#formpekerjaan")
    popup.style.display = "none";
    popup.style.position = "none";
    body.classList.remove("blur")
    body.style.filter= "none";
}
function closeformpkr(){
    const body = document.querySelector("#isi")
    const popup = document.querySelector("#formpkr")
    popup.style.display = "none";
    popup.style.position = "none";
    body.classList.remove("blur")
    body.style.filter= "none";
}
function closeformkjpp(){
    const body = document.querySelector("#isi")
    const popup = document.querySelector("#formpkr")
    popup.style.display = "none";
    popup.style.position = "none";
    body.classList.remove("blur")
    body.style.filter= "none";
}
function closeformpr(){
    const body = document.querySelector("#isi")
    const popup = document.querySelector("#formpr")
    popup.style.display = "none";
    popup.style.position = "none";
    body.classList.remove("blur")
    body.style.filter= "none";
}
function closeformpk(){
    const body = document.querySelector("#isi")
    const popup = document.querySelector("#formpk")
    popup.style.display = "none";
    popup.style.position = "none";
    body.classList.remove("blur")
    body.style.filter= "none";
}
function closeformtmpb(){
    const body = document.querySelector("#isi")
    const popup = document.querySelector("#formtmpb")
    popup.style.display = "none";
    popup.style.position = "none";
    body.classList.remove("blur")
    body.style.filter= "none";
}
function closeformcba(){
    const body = document.querySelector("#isi")
    const popup = document.querySelector("#formcba")
    popup.style.display = "none";
    popup.style.position = "none";
    body.classList.remove("blur")
    body.style.filter= "none";
}
function submitform(){
    var no = document.createElement("td")
    var ko = document.createElement("td")
    var je = document.createElement("td")
    var vo = document.createElement("td")
    var lo = document.createElement("td")
    var tr = document.createElement("tr")
    var nomor = document.getElementsByClassName("nomorpekerja")
    var i = nomor.length
    var nom = i + 1
    console.log(nom)
    var kode = document.getElementById("kode").value
    var jenis = document.getElementById("jenis-pekerjaan").value
    var volume = document.getElementById("Volume").value
    var lokasi = document.getElementById("Lokasi").value
    var n = document.createTextNode(nom);
    var k = document.createTextNode(kode);
    var j = document.createTextNode(jenis);
    var v = document.createTextNode(volume);
    var l = document.createTextNode(lokasi);
    no.appendChild(n)
    ko.appendChild(k)
    je.appendChild(j)
    vo.appendChild(v)
    lo.appendChild(l)

    
    let ikode = document.createElement("input")
    let ijenis = document.createElement("input")
    let ivolume = document.createElement("input")
    let ilokasi = document.createElement("input")
    let form = document.getElementById("kirim")

    ikode.type = "hidden";
    ikode.name = "pkode[]"
    ikode.value = kode;
    
    ijenis.type = "hidden";
    ijenis.value = jenis;
    ijenis.name = "pjenis[]"
    
    ivolume.type = "hidden";
    ivolume.value = volume;
    ivolume.name = "pvolume[]"
    
    ilokasi.type = "hidden";
    ilokasi.value = lokasi;
    ilokasi.name = "plokasi[]"
    form.appendChild(ikode)
    form.appendChild(ijenis)
    form.appendChild(ivolume)
    form.appendChild(ilokasi)


    no.classList.add("nomorpekerja")
    tr.appendChild(no)
    tr.appendChild(ko)
    tr.appendChild(je)
    tr.appendChild(vo)
    tr.appendChild(lo)
    document.getElementById("pekerjaan").appendChild(tr)
       closeformpekerjaan()

    document.getElementById("kode").value = ""
    document.getElementById("jenis-pekerjaan").value = ""
    document.getElementById("Volume").value = ""
    document.getElementById("Lokasi").value = ""





}