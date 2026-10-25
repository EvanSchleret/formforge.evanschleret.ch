<script setup lang="ts">
import type { FormForgeBuilderDraft } from '@evanschleret/formforgeclient/runtime'

const draft = ref<Partial<FormForgeBuilderDraft>>({
    uuid: null,
    key: null,
    schema_version: 2,
    title: 'Share your feedback',
    publish_at: null,
    pause_at: null,
    response_limit: null,
    submission_code_required: false,
    public_url: null,
    category: null,
    pages: [{
        page_key: 'pg_experience',
        title: 'Your experience',
        description: 'Tell us a little about your visit.',
        meta: {},
        fields: [
            {
                field_key: 'fk_name',
                type: 'text',
                name: 'name',
                page_key: 'pg_experience',
                label: 'Your name',
                required: true,
                nullable: false,
                default: null,
                rules: [],
                meta: {},
                placeholder: 'Alex'
            },
            {
                field_key: 'fk_rating',
                type: 'radio',
                name: 'rating',
                page_key: 'pg_experience',
                label: 'How was your visit?',
                required: true,
                nullable: false,
                default: null,
                rules: [],
                meta: {},
                display: 'list',
                options: [
                    { label: 'Great', value: 'great' },
                    { label: 'Good', value: 'good' },
                    { label: 'Could be better', value: 'could_be_better' }
                ]
            },
            {
                field_key: 'fk_follow_up',
                type: 'consent',
                name: 'follow_up',
                page_key: 'pg_experience',
                label: 'Follow-up',
                required: false,
                nullable: false,
                default: null,
                rules: [],
                meta: {},
                consent_label: 'You may contact me about this feedback.'
            }
        ]
    }],
    conditions: [],
    drafts: { enabled: false },
    api: {}
})

definePageMeta({
    layout: 'docs',
    path: '/docs/client/components/formforge-builder-demo'
})

useSeoMeta({
    title: 'FormForgeBuilder demo'
})
</script>

<template>
    <UPage>
        <UPageHeader
            title="FormForgeBuilder demo"
            description="Explore the builder using a local draft. Changes are not saved to a backend."
            headline="FormForge Client"
        >
            <template #links>
                <UButton
                    to="/docs/client/components/formforge-builder"
                    variant="outline"
                    icon="i-lucide-book-open"
                >
                    Documentation
                </UButton>
            </template>
        </UPageHeader>

        <UPageBody>
            <div class="not-prose my-6">
                <UAlert
                    class="mb-4"
                    color="neutral"
                    variant="subtle"
                    icon="i-lucide-laptop-minimal"
                    title="Local-only demo"
                    description="Edit the sample form below. Changes stay in this page and disappear when you reload it."
                />
                <div class="overflow-x-auto rounded-xl border border-default bg-default p-4 sm:p-6">
                    <ClientOnly>
                        <LazyFormForgeBuilder
                            v-model="draft"
                            :autosave="false"
                            standalone
                            hide-settings
                            locale="en"
                        />

                        <template #fallback>
                            <div class="min-h-40" />
                        </template>
                    </ClientOnly>
                </div>
            </div>
        </UPageBody>
    </UPage>
</template>
