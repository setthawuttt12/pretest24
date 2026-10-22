<template>
    <v-container>
        <v-row>
            <v-col cols="12">
                <v-form v-if="user.status_eva === 2 || user.status_eva === 3" >
                    <h1 class="font-weight-bold">ผลการประเมินของผู้รับการประเมินผล</h1>
                    <v-card :elevation="5" rounded class="pa-5 py-5">
                        <p>ผู้ใช้งาน : {{ user.fname }} {{ user.lname }}</p>
                        <p>รอบการประเมินที่ : {{ user.round_sys }} ปี {{ user.year_sys}}</p>
                    </v-card>
                    <v-row v-for="(topic,t) in topics" :key="topic.id_topic">
                        <v-col cols="12">
                            <h1 class="font-weight-bold">{{ t+1 }}.{{ topic.name_topic }} </h1>
                            <v-table class="table">
                                <tr>
                                    <th class="border pa-2 bg-grey" style="width: 10%;">ตัวชี้วัด</th>
                                    <th class="border pa-2 bg-grey" style="width: 10%;">รายละเอียดตัวชี้วัด</th>
                                    <th class="border pa-2 bg-grey" style="width: 10%;">น้ำหนักคะแนน</th>
                                    <th class="border pa-2 bg-grey" style="width: 10%;">คะแนนเต็ม</th>
                                    <th class="border pa-2 bg-grey" style="width: 10%;">รายละเอียด</th>
                                    <th class="border pa-2 bg-grey" style="width: 10%;">ไฟล์</th>
                                    <th class="border pa-2 bg-grey" style="width: 10%;">คะแนนที่ได้</th>
                                </tr>
                                <tr v-for="(indicate,i) in topic.indicates" :key="indicate.id_indicate">
                                    <td class="text-center border pa-2" style="width: 10%;">{{ indicate.name_indicate }}</td>
                                    <td class="text-center border pa-2" style="width: 10%;">{{ indicate.detail_indicate }}</td>
                                    <td class="text-center border pa-2" style="width: 10%;">{{ indicate.point_indicate }}</td>
                                    <td class="text-center border pa-2" style="width: 10%;">{{ indicate.point_indicate*4 }}</td>
                                    <td class="text-center border pa-2" style="width: 10%;">{{ indicate.detail_eva || '-' }}</td>
                                    <td class="text-center border pa-2" style="width: 10%;"><v-btn class="text-center" color="info" prepend-icon="mdi-eye"  @click="view(indicate.file_eva)">เปิดดู</v-btn></td>
                                    <td class="text-center border pa-2" style="width: 10%;">{{ indicate.point_indicate*indicate.score_member }}</td>
                                </tr>
                            </v-table>
                        </v-col>
                    </v-row>
                    <div class="mt-4 text-end">
                        <v-card color="green" >คะแนนรวม : {{ user.total_eva }} คะแนน</v-card>
                    </div>
                </v-form>
                <v-alert variant="tonal" color="success" type="success" v-else-if="user.status_eva === 1">ยังไม่ได้ประเมินตนเอง</v-alert>
                <v-alert variant="tonal" color="error" type="error" v-else>ยังไม่มีแบบประเมิน</v-alert>
            </v-col>
        </v-row>
    </v-container>
</template>

<script setup lang="ts">
import axios from 'axios'
import { eva,api } from '~/API/base'


const user = ref<any>({})
const topics = ref<any>([])

const view = (file:string)=>{
    const url = new URL(`/uploads/file_eva/${(file)}`,api).href
    window.open(url,'_blank',)
}



const fetch = async()=>{
    const token = localStorage.getItem('token')
    try {
        const res = await axios.get(`${eva}/selfeva/user`,{headers:{Authorization:`Bearer ${token}`}})
        user.value = res.data
    } catch (error) {
        console.error('Error get user',error)
    }
}
const fetchTopic = async()=>{
    const token = localStorage.getItem('token')
    try {
        const res = await axios.get(`${eva}/score_member/topic`,{headers:{Authorization:`Bearer ${token}`}})
        topics.value = res.data
    } catch (error) {
        console.error('Error get user',error)
    }
}

onMounted(async()=>{
    await Promise.all([fetch(),fetchTopic()])
})


</script>

<style scoped>

</style>