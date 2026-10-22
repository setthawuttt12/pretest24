<template>
    <v-container>
        <v-row>
            <v-col cols="12" md="12">
                <v-card>
                    <v-card-text>
                        <h1 class="text-center text-h5">รายงาน</h1>
                        <v-table class="table mt-3">
                            <thead>
                                <tr>
                                    <th class="border text-center">ลำดับ</th>
                                    <th class="border text-center">รายงาน</th>
                                    <th class="border text-center">รายละเอียด</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="border text-center">1</td>
                                    <td class="border text-center">รายงาน</td>
                                    <td class="border text-center"><v-btn class="text-center" to="/Staff/re_eva" color="info">รายละเอียด</v-btn></td>
                                </tr>
                            </tbody>
                        </v-table>
                    </v-card-text>  
                    
                </v-card>
            </v-col>
        </v-row>
    </v-container>
</template>

<script setup lang="ts">

</script>

<style scoped>

</style>