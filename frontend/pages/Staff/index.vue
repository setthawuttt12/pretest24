<template>
    <v-container>
        <v-card :elevation="5" rounded>
            <v-sheet :elevation="5" rounded class="pa-4">
                <h1 class="font-weight-bold text-center" >DashBoard - Staff</h1>
                <v-card-text>
                <v-row>
                    <v-col cols="12" md="4" v-for="b in box" :key="b">
                        <v-card class="pa-5 py-4" :elevation="5" rounded >
                            <div class="text-center pa-2 text-h5">{{ b.title }}</div>
                            <div class="text-center pa-2 text-h5">{{ b.value }}</div>
                        </v-card>
                    </v-col>
                </v-row>
                <v-row>
                    <v-col cols="12" md="4" v-for="b in box2" :key="b">
                        <v-card class="pa-5 py-4" :elevation="5" rounded >
                            <div class="text-center pa-2 text-h5">{{ b.title }}</div>
                            <div class="text-center pa-2 text-h5">{{ b.value }}</div>
                        </v-card>
                    </v-col>
                </v-row>
            </v-card-text>
            </v-sheet>
        </v-card>
        <v-card class="mt-5" elevation="5" rounded>
            <v-sheet elevation="5" class="py-4" rounded>
                <h1 class="font-weight-bold text-center">ผู้รับการประเมินผลทั้งหมด</h1>
                <v-card-text>
                    <v-row>
                        <v-col cols="12" >
                            <v-table class="table">
                                <tr>
                                    <th class="border pa-2 bg-grey" style="width: 10%;">ลำดับ</th>
                                    <th class="border pa-2 bg-grey" style="width: 10%;">ชื่อ นามสกุล</th>
                                    <th class="border pa-2 bg-grey" style="width: 10%;">รอบการประเมินที่</th>
                                    <th class="border pa-2 bg-grey" style="width: 10%;">ปีการประเมิน</th>
                                </tr>
                                <tr v-for="r in round" :key="r">
                                    <td class="text-center border pa-2" style="width: 10%;">{{ 1 }}</td>
                                    <td class="text-center border pa-2" style="width: 10%;">{{ r.fname }}-{{ r.lname }}</td>
                                    <td class="text-center border pa-2" style="width: 10%;">{{ r.round_sys }}</td>
                                    <td class="text-center border pa-2" style="width: 10%;">{{ r.year_sys }}</td>
                                </tr>
                            </v-table>
                        </v-col>
                    </v-row>
                </v-card-text>
            </v-sheet>
        </v-card>
    </v-container>
</template>

<script setup lang="ts">
import axios from 'axios';
import { eva,api, staff } from '~/API/base';

const round = ref<any>([])
const box = ref([])
const box2 = ref([])

const fethB = async()=>{
    const token = localStorage.getItem('token')
    try {
        const res = await axios.get(`${api}/dash/staff`,{headers:{Authorization:`Bearer ${token}`}})
        box.value = res.data.box
        box2.value = res.data.box2
    } catch (error) {
        console.error('Error Box',error)
    }
}
const fethR = async()=>{
    const token = localStorage.getItem('token')
    try {
        const res = await axios.get(`${staff}/eva/show`,{headers:{Authorization:`Bearer ${token}`}})
        round.value = res.data
    } catch (error) {
        console.error('Error Round',error)
    }
}

onMounted(async()=>{
    await Promise.all([fethR(),fethB()])
})

</script>

<style scoped>

</style>