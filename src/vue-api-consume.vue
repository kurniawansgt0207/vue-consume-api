<script>
import axios from "axios";

export default {
    data() {
        return {
            employees: [],
            newEmployee: {
                name: "",
                email: "",
                designation: "",            
            },
            editEmployee: null
        };
    },
    methods: {    
        async fetchEmployees() {
            try {
                const response = await axios.get("https://cordova-media.com/apps/restapi/api/list");
                this.employees = response.data.slice(15); // Ambil 15 data pertama
            } catch (error) {
                console.error("Gagal mengambil data", error);
            }
        },

        async addEmployee() {
            try {
                const response = await axios.post("https://cordova-media.com/apps/restapi/api/store", this.newEmployee);
                this.employees.unshift(response.data);
                this.newEmployee = { name: "", email: "", designation: "" }; // Reset input
                this.fetchEmployees();
            } catch (error) {
                console.error("Gagal menambahkan data", error);
            }
        },

        async updateEmployee() {
            try {
                const response = await axios.put(`https://cordova-media.com/apps/restapi/api/update/${this.editEmployee.id}`, this.editEmployee);
                const index = this.employees.findIndex(employee => employee.id === this.editEmployee.id);
                this.employees[index] = response.data;
                this.fetchEmployees();
            } catch (error) {
                console.error("Gagal mengupdate data", error);
            }
        },
        
        async deleteEmployee(id) {
            try {
                await axios.delete(`https://cordova-media.com/apps/restapi/api/delete/${id}`);
                this.employees = this.employees.filter(employee => employee.id !== id);
            } catch (error) {
                console.error("Gagal menghapus data", error);
            }
        },

        // 🔹 Set data yang akan diedit
        setEditEmployee(employee) {
            this.editEmployee = { ...employee };
        }
    },
    mounted() {
        this.fetchEmployees();
    }
};
</script>

<template>
  <div>
    <h2>CRUD dengan Vue & REST API</h2>

    <!-- Form Tambah Data -->
    <div>
      <h3>Tambah Employee</h3>
      <input v-model="newEmployee.name" placeholder="Nama Karyawan" />
      <input v-model="newEmployee.email" placeholder="Alamat Email Karyawan" />
      <input v-model="newEmployee.designation" placeholder="Posisi/Jabatan Karyawan" />
      <button @click="addEmployee">Tambah</button>
    </div>

    <!-- Form Edit Data -->
    <div v-if="editEmployee">
      <h3>Edit Employee</h3>
      <input v-model="editEmployee.name" />
      <input v-model="editEmployee.email" />
      <input v-model="editEmployee.designation" />
      <button @click="updateEmployee">Simpan Perubahan</button>
      <button @click="editEmployee = null">Batal</button>
    </div>

    <!-- Tampilkan Data -->
    <table border="1" style="border-collapse: collapse;margin-left: 10px;" cellpadding="2">
        <tr style="background-color: green">
            <th style="color:white">No</th>
            <th style="color:white">Nama Karyawan</th>
            <th>Email</th>
            <th>Jabatan/Posisi</th>
            <th>#</th>
        </tr>
        <tr v-for="(emp,index) in employees" :key="emp.id">
            <td>{{ index+1 }}</td>
            <td>{{ emp.name }}</td>
            <td>{{ emp.email }}</td>
            <td>{{ emp.designation }}</td>
            <td>
                <button @click="setEditEmployee(emp)">Ubah</button>
                <button @click="deleteEmployee(emp.id)">Hapus</button>
            </td>
        </tr>
    </table>
  </div>
</template>

<style>
button {
  margin: 5px;
}
</style>
