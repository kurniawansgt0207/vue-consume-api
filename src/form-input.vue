<template>
    <div class="container">
      <h2>Form Pendaftaran</h2>
  
      <!-- Input Nama -->
      <label>Nama:</label>
      <input type="text" v-model="formData.nama" placeholder="Masukkan nama Anda">
  
      <!-- Input Email -->
      <label>Email:</label>
      <input type="email" v-model="formData.email" :placeholder="emailPlaceholder">
  
      <!-- Pilihan Gender -->
      <label>Gender:</label>
      <select v-model="formData.gender">
        <option value="Laki-laki">Laki-laki</option>
        <option value="Perempuan">Perempuan</option>
      </select>
  
      <!-- Checkbox Menampilkan Input Tambahan -->
      <label>
        <input type="checkbox" v-model="showAdditional"> Tampilkan Input Tambahan
      </label>
  
      <!-- Input Tambahan (Ditampilkan Jika Checkbox Dicentang) -->
      <div v-if="showAdditional">
        <label>Hobi:</label>
        <input type="text" v-model="formData.hobi" placeholder="Masukkan hobi Anda">
      </div>
  
      <!-- Input Angka dengan Validasi -->
      <label>Umur:</label>
      <input type="number" v-model="formData.umur" @input="cekUmur">
      <p v-if="errorUmur" class="error">{{ errorUmur }}</p>
  
      <!-- Daftar Input Dinamis (Menggunakan v-for) -->
      <h3>Daftar Teman:</h3>
      <div v-for="(teman, index) in formData.teman" :key="index">
        <input v-model="formData.teman[index]" placeholder="Nama teman">
      </div>
      <button @click="tambahTeman">Tambah Teman</button>
  
      <!-- Tombol Submit -->
      <button @click="submitForm">Kirim</button>
  
      <!-- Data yang Sudah Diisi -->
      <h3>Data yang Diisi:</h3>
      <pre>{{ formData }}</pre>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        formData: {
          nama: "",
          email: "",
          gender: "",
          hobi: "",
          umur: "",
          teman: [""]
        },
        emailPlaceholder: "Masukkan email Anda",
        showAdditional: false,
        errorUmur: ""
      };
    },
    methods: {
      cekUmur() {
        if (this.formData.umur < 1) {
          this.errorUmur = "Umur harus lebih dari 0!";
        } else {
          this.errorUmur = "";
        }
      },
      tambahTeman() {
        this.formData.teman.push("");
      },
      submitForm() {
        alert("Data berhasil dikirim!");
        console.log("Data Form:", this.formData);
      }
    }
  };
  </script>
  
  <style scoped>
  @import url('@/assets/form.css');
  </style>
  