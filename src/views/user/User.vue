<template>
  <el-table :data="users">
    <el-table-column prop="id" label="Id" />
    <el-table-column prop="name" label="Name" />
    <el-table-column prop="email" label="Email" />
  </el-table>
</template>

<script setup>
import { ref, onMounted } from 'vue'
let users = ref([])
let getUsers = () => {
  return axiosReq({
    // baseURL: 'http://8.135.1.141/micro-service-test',
    url: '/api/v0.1/user',
    baseURL: `http://${location.hostname}:5000`,
    // url: 'https://localhost:7110/WeatherForecast',
    headers: {
      'Access-Control-Allow-Origin': '*',
    },
    // data: { id: 'fai' },
    method: 'get',
    // isParams: true,
    // bfLoading: true
  }).then((res) => {
    users.value = res.data
  }).catch((err) => {
    console.log('接口catch', err)
  })
}

onMounted(() => {
  getUsers()
})
</script>

<style scoped lang="scss"></style>
