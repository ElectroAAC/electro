import Posts from '~/pages/dashboard/news/index.vue'
import CreatePost from '~/pages/dashboard/news/create.vue'
import EditPost from '~/pages/dashboard/news/edit.vue'

export default [
  {
    path: '/dashboard/news',
    component: Posts,
    name: 'Dashboard - Posts',
    meta: {
      name: 'dashboard-posts'
    }
  },
  {
    path: '/dashboard/news/create',
    component: CreatePost,
    name: 'Dashboard - Posts Create',
    meta: {
      name: 'dashboard-posts-create'
    }
  },
  {
    path: '/dashboard/news/edit/:id',
    component: EditPost,
    name: 'Dashboard - Posts Edit',
    meta: {
      name: 'dashboard-posts-edit'
    }
  },
]