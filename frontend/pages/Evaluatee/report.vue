<template>
    <v-container>
        <v-row>
            <v-col cols="12">
                <v-form v-if="user.status_eva === 2 || user.status_eva === 3" >
                    <h1 class="font-weight-bold">ผลการประเมินของกรรมการประเมิน</h1>
                    
                    <v-row v-for="(topic,t) in topics" :key="topic.id_topic">
                        <v-col cols="12">
                            <h1 class="font-weight-bold">{{ t+1 }}.{{ topic.name_topic }} </h1>
                            <v-table class="table">
                                <tr>
                                    <th class="border pa-2 bg-grey" style="width: 10%;">ตัวชี้วัด</th>
                                    <th class="border pa-2 bg-grey" style="width: 10%;">รายละเอียดตัวชี้วัด</th>
                                    <th class="border pa-2 bg-grey" style="width: 10%;">น้ำหนักคะแนน</th>
                                    <th class="border pa-2 bg-grey" style="width: 10%;">คะแนนเต็ม</th>
                                    <th class="border pa-2 bg-grey" style="width: 10%;">คะแนนที่ได้</th>
                                </tr>
                                <tr v-for="(indicate,i) in topic.indicates" :key="indicate.id_indicate">
                                    <td class="text-center border pa-2" style="width: 10%;">{{ indicate.name_indicate }}</td>
                                    <td class="text-center border pa-2" style="width: 10%;">{{ indicate.detail_indicate }}</td>
                                    <td class="text-center border pa-2" style="width: 10%;">{{ indicate.point_indicate }}</td>
                                    <td class="text-center border pa-2" style="width: 10%;">{{ indicate.point_indicate*4 }}</td>
                                    <td class="text-center border pa-2" style="width: 10%;">{{ (((scores[indicate.id_indicate]?. a ?? 0)+(scores[indicate.id_indicate]?. b ?? 0)+(scores[indicate.id_indicate]?. c ?? 0))/3).toFixed(2) }}</td>
                                </tr>
                            </v-table>
                        </v-col>
                    </v-row>
                    <div class="mt-4 text-end">
                        <v-card color="green" >คะแนนรวมสุทธิ : {{ ((user.total_commit)/3).toFixed(2) }} คะแนน</v-card>
                    </div>
                    <div class="mt-3">
                        <v-card elevation="5" rounded>
                            <label for="">ขอเสนอแนะของกรรมการ</label>
                            <v-row>
                                <v-col cols="12" md="4" v-for="(commit,c) in commits" :key="commit.id_commit" >
                                    <img :src="`http://localhost:3001/api/signature/${commit.signature}`" :alt="`รอ${commit.level_commit}ประเมิน`" width="20%"> <br>
                                    (({{ commit.fname }} {{ commit.lname }})) <br>
                                    {{ commit.level_commit }}
                                </v-col>
                            </v-row>
                        </v-card>
                    </div>
                    <div class="mt-4 text-center">
                        <v-btn color="warning" @click="print" class="no-p" type="submit">พิมพ์</v-btn>
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
const scores = ref<any>([])
const commits = ref<any>([])
    

const print = ()=>{
    window.print()
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
const fetchScore = async()=>{
    const token = localStorage.getItem('token')
    try {
        const res = await axios.get(`${eva}/score_commit/score`,{headers:{Authorization:`Bearer ${token}`}})
        scores.value = res.data
    } catch (error) {
        console.error('Error get user',error)
    }
}
const fetchCommit = async()=>{
    const token = localStorage.getItem('token')
    try {
        const res = await axios.get(`${eva}/score_commit/commit`,{headers:{Authorization:`Bearer ${token}`}})
        commits.value = res.data
    } catch (error) {
        console.error('Error get user',error)
    }
}

onMounted(async()=>{
    await Promise.all([fetch(),fetchTopic(),fetchScore(),fetchCommit()])
})


</script>

<style scoped>
@media print {
    .v-app-bar,.v-btn.no-p{
        display: none !important;
        margin: 0 !important;
        margin-top: 0 !important;
        padding: 0 !important;
        width: 100% !important;
    }
}
</style>