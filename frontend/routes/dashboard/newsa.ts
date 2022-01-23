import Posts from '~/pages/dashboard/posts.vue'

export default [
  {
    path: '/dashboard/news',
    component: Posts,
    name: 'Dashboard - Posts',
    meta: {
      name: 'dashboard-posts'
    }
  },
]