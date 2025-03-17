<template>
    <div id="container">
        <h2>Formulir Data Diri</h2>

        <label>Nama:</label>
        <input type="text" v-model="inputData.nama" placeholder="Masukkan nama Anda">
        <br/>
        <label>Email:</label>
        <input type="email" v-model="inputData.email" :placeholder="emailPlaceholder">
        <br/>    
        <label>Gender:</label>
        <input type="radio" v-model="inputData.gender" value="Laki-laki"> Laki-laki
        <input type="radio" v-model="inputData.gender" value="Perempuan"> Perempuan
        <br/>
        <label>Kota Tempat Tinggal:</label>
        <select v-model="inputData.kota">
            <option v-for="city in cities" :value="city">{{ city }}</option>
            <!--<option value="Jakarta">Jakarta</option>
            <option value="Bandung">Bandung</option>
            <option value="Semarang">Semarang</option>
            <option value="Yogyakarta">Yogyakarta</option>
            <option value="Surabaya">Surabaya</option>-->
        </select>
        <br/>
        <button @click="submitForm">Simpan</button>
        <br/>
        <h3>Data yang Diisi:</h3>
        <pre>{{ inputData }}</pre>
    </div>
</template>

<script>
    export default {
    data() {
      return {
        inputData: {
          nama: "",
          email: "",
          gender: "",
          kota: "",
        },
        emailPlaceholder: "Masukkan email Anda",
        cities:
        [
            'Jakarta','Bandung','Semarang','Yogyakarta','Surabaya'
        ]        
      };
    },
    methods: {
      submitForm() {
        alert("Data berhasil dikirim!");
        console.log("Data Form:", this.inputData);
      }
    }
  };
</script>

<style>
    #container {
        margin-left: 100px;
        margin-top: 10px;
    }
</style>